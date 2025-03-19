import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="field-input"
export default class extends Controller {
  connect() {
    console.log("coucou du field-input controller")
  }

  static targets = ["togglableElement", "input"]

  toggle() {
    console.log("Hello from toggle")
    console.log(this.inputTarget.value)

    if (this.inputTarget.value === "Distance challenge") {
      this.togglableElementTargets.forEach((element)=> {
        element.classList.remove('d-none');
      })
    }
    else {
      this.togglableElementTargets.forEach(element => element.classList.add('d-none'))
    }

  }

  toggleField(event) {
    // Vérifier si l'élément cliqué est l'input
    if (event.target === this.inputTarget) {
      this.togglableElementTargets.forEach((element) => {
        element.classList.remove("d-none");
      });
    }
  }
}
