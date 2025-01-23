import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "errorMessages"]

  connect() {
    // Prevent default form submission if there are server-side errors
    this.formTarget.addEventListener('ajax:error', (event) => {
      event.preventDefault()
    })
  }

  // Clear error messages when user starts typing
  clearErrors() {
    const errorContainer = this.element.querySelector('.error-messages')
    if (errorContainer) {
      errorContainer.innerHTML = ''
    }
  }
} 
