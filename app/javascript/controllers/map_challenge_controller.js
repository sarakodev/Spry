import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    showControls: { type: Boolean, default: true },
    showPopup: { type: Boolean, default: true },
    zoomMap: { type: Boolean, default: true },
    progress: { type: Number, default: 0 } // Valeur pour la progression, voir pour connecter avec notre DB
  }
  connect() {
    console.log(this.markersValue)
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      zoom: 10
    })

    this.map.on('load', () => {
      this.#addMarkersToMap();
      this.#addLineBetweenMarkers();
      this.#addProgressMarker();
      this.#fitMapToMarkers();
    });

    if (this.showControlsValue) {
      this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl }))
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div");
      customMarker.innerHTML = marker.marker_html;

      if (this.showPopupValue) {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);

        // Pass the element as an argument to the new marker with popup
        new mapboxgl.Marker({ element: customMarker })
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map);
      } else {
        // Pass the element as an argument to the new marker without popup
        new mapboxgl.Marker({ element: customMarker })
          .setLngLat([marker.lng, marker.lat])
          .addTo(this.map);
      }
    });
  }

  #addLineBetweenMarkers() {
    if (this.markersValue.length >= 2) {
      const start = this.markersValue[0];
      const end = this.markersValue[1];

      this.map.addSource('route', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'properties': {},
          'geometry': {
            'type': 'LineString',
            'coordinates': [
              [start.lng, start.lat],
              [end.lng, end.lat]
            ]
          }
        }
      });

      this.map.addLayer({
        'id': 'route',
        'type': 'line',
        'source': 'route',
        'layout': {
          'line-join': 'round',
          'line-cap': 'round'
        },
        'paint': {
          'line-color': '#FF5400',
          'line-width': 6
        }
      });
    }
  }

  #addProgressMarker() {
    if (this.markersValue.length >= 2) {
      const start = this.markersValue[0];
      const end = this.markersValue[1];


      const progressLng = start.lng + (end.lng - start.lng) * this.progressValue;
      const progressLat = start.lat + (end.lat - start.lat) * this.progressValue;
      console.log(progressLat);
      
      if (this.progressMarker) {
        this.progressMarker.setLngLat([progressLng, progressLat]);
      } else {
        this.progressMarker = new mapboxgl.Marker({ color: 'red' })
          .setLngLat([progressLng, progressLat])
          .addTo(this.map);
      }
    }
  }

  #fitMapToMarkers() {
    console.log("Zoom Map Value:", this.zoomMapValue);
    const bounds = new mapboxgl.LngLatBounds();

    this.markersValue.forEach(marker => {
      bounds.extend([marker.lng, marker.lat]);
    });

    const paddingOptions = this.zoomMapValue
      ? { padding: 60, maxZoom: 3.5, duration: 0 } // Augmentez le padding pour le zoom France
      : { padding: 100, maxZoom: 3.5, duration: 0 }; // Augmentez le padding pour le zoom Monde

    console.log("Applying zoom with bounds:", bounds);
    this.map.fitBounds(bounds, paddingOptions);
  }

  getMapInstance() {
    return this.map
  }
}
