import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["input", "results"]

  fetchBooks(query) {
    fetch(`https://openlibrary.org/search.json?q=${query}&fields=title,isbn`)
      .then(response => response.json())
      .then(data => this.insertBooks(data))
        
  }

  insertBooks(data) {
    const maxResults = 10;
    let books = [];

    if (data.docs.length > maxResults) {
      console.log("I got to the max!");
      for (let i = 0; i < maxResults; i++) {
        books.push(data.docs[i]);
      }
    } else {
      console.log("I got to the else!")
      books = data.docs;
    }

    this.buildCards(books);
  }

  search(event) {
    console.log("hello from search");
    event.preventDefault();
    this.resultsTarget.innerHTML = "";
    this.fetchBooks(this.inputTarget.value.split(' ').join('+'));
  }

  buildCards(books){
    const randIndex = Math.floor(Math.random() * books.length);
    books.forEach((book) => {
      const bookCard = `<div class="card-item" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('https://covers.openlibrary.org/b/isbn/${book.isbn[randIndex]}-S.jpg');">
      <h3>${book.title}</h3>
      </div>
      `;
      this.resultsTarget.insertAdjacentHTML("beforeend", bookCard);  
    });
    
  }
}
