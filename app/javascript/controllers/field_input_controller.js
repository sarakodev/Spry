import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="field-input"
export default class extends Controller {
  connect() {
    console.log("coucou du field-input controller")
  }

  static targets = ["togglableElement", "input"]

  toggleDistance() {
    console.log("Hello from toggleDistance")
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

  toggleDuration() {
    console.log("Hello from toggleDuration")
    console.log(this.inputTarget.value)

    if (this.inputTarget.value === "Duration challenge") {
      this.togglableElementTargets.forEach((element)=> {
        element.classList.remove('d-none');
      })
    }
    else {
      this.togglableElementTargets.forEach(element => element.classList.add('d-none'))
    }
  }
}
