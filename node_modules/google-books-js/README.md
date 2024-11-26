# Google Books JS

This is a simple Javascript wrapper for the Google Books API.
The goal of this library is to make easy retrieving information from their API.
You can use it on a `NodeJS` project or a `Web` project.

## Installation

```
$ npm install google-books-js
```

## Usage

### Searching for books

```typescript
import { GoogleBooksAPI } from "google-books-js";

const googleBooksApi = new GoogleBooksAPI();

async function fetchBooks(): Promise<void> {
  const books = await googleBooksApi.search({
    filters: {
      title: "Bartleby",
    },
  });

  console.log(books);
}

fetchBooks();
```

### Getting a book by its ID

```typescript
import { GoogleBooksAPI } from "google-books-js";

const googleBooksApi = new GoogleBooksAPI();

async function fetchBook(): Promise<void> {
  const book = await googleBooksApi.getVolume("bookId");

  console.log(book);
}

fetchBook();
```

## Methods

- `search()`

  - **parameters**:

    - `filters`:
      - `title: string`
      - `author: string`
      - `subject: string`
      - `isbn: string`

  - **returns** `SearchResult`:

    - `kind: string`
    - `totalItems: number`
    - `items: Volume[]`

  - **example**:

    ```typescript
    const books = await googleBooksApi.search({
      filters: {
        title: "The old and the sea",
        author: "Ernest Heminghway",
      },
    });
    ```

- `getVolume()`

  - **parameters**:

    - `volumeId: string`

  - **returns** `Volume`

  - **example**:

  ```typescript
  const book = await api.getVolume("SDepCQAAQBAJ");
  ```

## Types

- `SearchResult`:

  - `kind: string`
  - `totalItems: number`
  - `items: Volume[]`

- `Volume`
  - `id: string`
  - `etag: string`
  - `kind: string`
  - `selfLink: string`
  - `volumeInfo`:
    - `title: string`
    - `subtitle: string`
    - `description: string`
    - `authors: string[]`
    - `publisher: string`
    - `publishedDate: string`
    - `industryIdentifiers`:
      - `type: string`
      - `identifier: string`
    - `pageCount: number`
    - `printType: string`
    - `categories: string[]`
    - `maturityRating: string`
    - `imageLinks`:
      - `smallThumbnail: string`
      - `thumbnail: string`
    - `previewLink: string`
    - `infoLink: string`
    - `canonicalVolumeLink: string`

## Roadmap

- [ ] Implemented the API Key support
- [ ] Implement the pagination on search
- [ ] Improve typings
