import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="field-input"
export default class extends Controller {
  static targets = ["togglableElementDistance", "togglableElementDuration", "input"]

  connect() {
    console.log("Hello from field-input controller");
  }

  toggleFields() {
    console.log(this.inputTarget.value);

    if (this.inputTarget.value === "Distance challenge") {
      this.showElements(this.togglableElementDistanceTargets);
      this.hideElements(this.togglableElementDurationTargets);
    } else if (this.inputTarget.value === "Duration challenge") {
      this.showElements(this.togglableElementDurationTargets);
      this.hideElements(this.togglableElementDistanceTargets);
    } else {
      this.hideElements(this.togglableElementDistanceTargets);
      this.hideElements(this.togglableElementDurationTargets);
    }
  }

  showElements(elements) {
    elements.forEach(element => element.classList.remove("d-none"));
  }

  hideElements(elements) {
    elements.forEach(element => element.classList.add("d-none"));
  }
}
