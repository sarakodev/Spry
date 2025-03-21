import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="duration"
export default class extends Controller {
  static targets = ["inputValue", "newInputValue"]
  connect() {
    this.currentValue = parseFloat(this.inputValueTarget.value)
  }

  increment() {
    this.inputValueTarget.value = this.currentValue + parseFloat(this.newInputValueTarget.value)
  }
}
