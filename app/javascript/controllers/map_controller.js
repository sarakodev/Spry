import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    showControls: { type: Boolean, default: true },
    showPopup: { type: Boolean, default: true },
    zoomMap: { type: Boolean, default: true },
  }
  connect() {
    console.log(this.markersValue)
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      zoom: 10
    })

    this.map.on('load', () => {
      this.#addMarkersToMap();
      this.#fitMapToMarkers();
    });

    if (this.showControlsValue) {
      this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl, placeholder: "Search here", marker: "" }))
    }
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div");
      customMarker.innerHTML = marker.marker_html;
      if (this.showPopupValue) {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
        new mapboxgl.Marker({ element: customMarker })
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
      } else {
        new mapboxgl.Marker({ element: customMarker })
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
      }
    });
  }

  #fitMapToMarkers() {
    if (this.zoomMapValue) {
      // Zoom France : true
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.map.fitBounds(bounds, { padding: 40, maxZoom: 10, duration: 0 })
    } else {
      // Zoom Monde : false
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 5, duration: 0 })
    }
  }

  getMapInstance() {
    return this.map
  }
}
