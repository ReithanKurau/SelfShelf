require 'open-uri'

class BookApiService
  def initialize(query)
    @query = query
    # @url = "https://openlibrary.org/search.json?q=#{query}&fields=title,isbn,first_publish_year"
    @url = "https://www.googleapis.com/books/v1/volumes?q=intitle:#{query}&key=AIzaSyDGkmmoNa5lJzBlLcijbpD3m-PG7L5-SAg"
  end

  def call
    json = URI.open(@url).read
    results = JSON.parse(json)
    results['items'].map do |result|
      # interest = Interest.find_by(title: result['title'], publishing_year: result['first_publish_year'])
      interest = Interest.find_by(title: result['volumeInfo']['title'])
      if interest.nil?
        Interest.create(
          title: result['volumeInfo']['title'],
          publishing_year: result['volumeInfo']['publishedDate']&.split('-')&.first,
          description: result['volumeInfo']['description'],
          creator: result['volumeInfo']['authors']&.join(', '),
          genre: result['volumeInfo']['categories']&.join(', '),
          cover: "http://books.google.com/books/content?id=#{result['id']}&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          media_type: 'book'
        )
      else
        interest
      end
    end.select(&:id)
  end
end
