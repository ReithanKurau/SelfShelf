require 'open-uri'

class BookApiService
  def initialize(query)
    @query = query
    # @url = "https://openlibrary.org/search.json?q=#{query}&fields=title,isbn,first_publish_year"
    @url = "https://www.googleapis.com/books/v1/volumes?q=intitle:#{query}"
  end

  def call
    json = URI.open(@url).read
    results = JSON.parse(json)
    # results['docs'].first(10).map do |result|
    results['items'].first(15).map do |result|
      # interest = Interest.find_by(title: result['title'], publishing_year: result['first_publish_year'])
      interest = Interest.find_by(title: result['volumeInfo']['title'])
      if interest.nil?
        Interest.create(
          title: result['volumeInfo']['title'],
          publishing_year: result['volumeInfo']['publishedDate'],
          description: result['volumeInfo']['description'],
          creator: result['volumeInfo']['authors'],
          genre: result['volumeInfo']['categories'],
          cover: "http://books.google.com/books/content?id=#{result['id']}&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          media_type: 'book'
        )
      else
        interest
      end
    end.select(&:id)
  end
end
