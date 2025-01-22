import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["progressBar"]
  static values = {
    currentQuestion: Number,
    totalQuestions: Number
  }

  connect() {
    this.updateProgress()
  }

  currentQuestionValueChanged() {
    this.updateProgress()
  }

  updateProgress() {
    const progress = this.currentQuestionValue
    this.progressBarTarget.style.width = `${Math.max(progress, 2)}%`
    this.progressBarTarget.setAttribute('aria-valuenow', progress)
  }
} 