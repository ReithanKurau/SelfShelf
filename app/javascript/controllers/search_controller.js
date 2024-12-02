import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["input", "results"]

  // fetchMovies(query) {
  //   fetch(`https://api.themoviedb.org/3/search/movie?query=${query}&api_key=7a1ee3663533611fa054763973c22bda`)
  //     .then(response => response.json())
  //     .then(data => this.insertMovies(data))
  // }

  // insertMovies(data) {
  //   data.results.forEach((result) => {
  //     console.log(result.poster_path);
  //     const movieCard = `<div class="card-item" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('https://image.tmdb.org/t/p/w200${result.poster_path}');">
  //       <h3>${result.title}</h3>
  //       </div>`
  //       this.resultsTarget.insertAdjacentHTML("beforeend", movieCard)
  //   })
  // }

  // search(event) {
  //   event.preventDefault()
  //   this.resultsTarget.innerHTML = ""
  //   this.fetchMovies(this.inputTarget.value.split(' ').join('+'))
  // }

  search(event) {
    const url = `${event.currentTarget.action}?query=${this.inputTarget.value.split(' ').join('+')}`
    console.log(url);
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.resultsTarget.outerHTML = data;
      })
  }

}
