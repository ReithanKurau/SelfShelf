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
      console.log(result.poster_path);
      const movieCard = `<div class="card-item" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('<%= image_path('https://image.tmdb.org/t/p/w200${result.poster_path}')" %>')>
        <h3>${result.title}</h3>
        <p>${result.release_date}</p>
        </div>`
        this.resultsTarget.insertAdjacentHTML("beforeend", movieCard)
    })
  }

  search(event) {
    event.preventDefault()
    this.resultsTarget.innerHTML = ""
    this.fetchMovies(this.inputTarget.value)
  }

}
