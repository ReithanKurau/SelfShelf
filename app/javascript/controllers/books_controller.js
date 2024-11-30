import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["input", "results"]

  fetchBooks(query) {
    fetch(`https://openlibrary.org/search.json?q=${query}`)
      .then(response => response.json())
      .then(data => this.insertBooks(data))
  }

  insertBooks(data) {
    data.docs.forEach((result) => {
      console.log(9798515664459);
      const bookCard = `<div class="card-item" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('https://covers.openlibrary.org/b/isbn/${9798515664459}-S.jpg');">
        <h3>${result.title}</h3>
        </div>
        `
        this.resultsTarget.insertAdjacentHTML("beforeend", bookCard)
    })
  }

  search(event) {
    console.log("hello from insertbooks")
    event.preventDefault()
    this.resultsTarget.innerHTML = ""
    this.fetchBooks(this.inputTarget.value.split(' ').join('+'))
  }
}
