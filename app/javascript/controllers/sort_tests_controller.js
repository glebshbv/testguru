// app/javascript/controllers/sort_tests_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["testsContainer"]

  connect() {
    this.tests = Array.from(this.testsContainerTarget.children)
  }

  sortByTitle(event) {
    event.preventDefault()
    this.tests = Array.from(this.testsContainerTarget.children)
    
    const sortedTests = [...this.tests].sort((a, b) => {
      const titleA = a.querySelector('[data-test-title]').textContent.trim().toLowerCase()
      const titleB = b.querySelector('[data-test-title]').textContent.trim().toLowerCase()
      return titleA.localeCompare(titleB)
    })

    this.testsContainerTarget.innerHTML = ''
    sortedTests.forEach(test => {
      this.testsContainerTarget.appendChild(test)
    })
  }
}
