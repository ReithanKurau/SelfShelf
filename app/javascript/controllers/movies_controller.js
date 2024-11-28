import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["input", "results"]

  fetchMovies(query) {
    fetch(`https://api.themoviedb.org/3/search/movie?query=${this.inputTarget.value.split(' ').join('+')}&api_key=7a1ee3663533611fa054763973c22bda`)
      .then(response => response.json())
      .then(data => this.insertMovies(data))
  }

  insertMovies(data) {
    data.results.forEach((result) => {
      const movieTag = `<li class="col">
        <h3>${result.title}</h3>
        <p>${result.release_date}</p>
        <p>${result.overview}</p>
        <img src="${result.poster_path}" alt="${result.title}" class="img-fluid"></img>
        </li>`
        this.resultsTarget.insertAdjacentHTML("beforeend", movieTag)
    })
  }

  search(event) {
    event.preventDefault()
    this.resultsTarget.innerHTML = ""
    this.fetchMovies(this.inputTarget.value)
  }

}
