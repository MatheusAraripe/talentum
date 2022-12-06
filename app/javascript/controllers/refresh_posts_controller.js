import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="refresh-posts"
export default class extends Controller {
  static targets = [ "form", "list", "searchInput" ]

  connect() {
    console.log(this.element);
    console.log(this.formTarget);
    console.log(this.listTarget);
    console.log(this.searchInputTarget);
    console.log('working')
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.searchInputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }
}
