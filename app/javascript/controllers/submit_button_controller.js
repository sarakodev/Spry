import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["submitButton"];

  connect() {
    setTimeout(() => {
      const mapboxInput = document.querySelector(".mapboxgl-ctrl-geocoder--input")
      console.log(this.submitButtonTarget)
      console.log(mapboxInput);

      mapboxInput.addEventListener('input', this.toggleSubmitButton.bind(this))
    }, 150);
  }

  toggleSubmitButton(e) {
    console.log(this.submitButtonTarget)
    if (e.currentTarget.value.trim() !== "") {
      this.submitButtonTarget.classList.remove("prevent-interaction");
    } else {
      this.submitButtonTarget.classList.add("prevent-interaction");
    }
  }



  // checkInput() {
  //   this.toggleSubmitButton();
  // }
}
