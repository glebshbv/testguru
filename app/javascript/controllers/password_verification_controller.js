import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "password", "message"]

  checkPassword() {
    const password = this.passwordTarget.value
    const confirmation = this.inputTarget.value
    
    this.inputTarget.classList.remove(
      'ring-2', 'ring-green-500', 'ring-red-500',
      'border-green-500', 'border-red-500'
    )
    
    this.messageTarget.classList.remove('text-green-600', 'text-red-600')
    
    if (confirmation === '') {
      this.messageTarget.textContent = ''
      return
    }
    
    if (confirmation === password) {
      this.inputTarget.classList.add('ring-1', 'ring-green-500', 'border-green-500')
      this.messageTarget.textContent = 'Passwords match'
      this.messageTarget.classList.add('text-green-600')
    } else {
      this.inputTarget.classList.add('ring-1', 'ring-red-500', 'border-red-500')
      this.messageTarget.textContent = 'Passwords do not match'
      this.messageTarget.classList.add('text-red-600')
    }
  }
}
