import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "form", "input", "list" ]

  connect() {
    console.log("users controller connected")
  }

  search() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }
}
