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
    #   interest = Interest.find_by(title: result['title'], publishing_year: result['first_publish_year'])
    #   if interest.nil?
    #     Interest.create(
    #       title: result['title'],
    #       publishing_year: result['first_publish_year'],
    #       description: 'none',
    #       cover: "https://covers.openlibrary.org/b/isbn/#{result['isbn']}-S.jpg",
    #       media_type: 'book'
    #     )
    #   else
    #     interest
    #   end
    # end.select(&:id)

    results['items'].first(10).map do |result|
      
      interest = Interest.find_by(title: result['volumeInfo']['title'])
      if interest.nil?
        Interest.create(
          title: result['volumeInfo']['title'],
          creator: result['volumeInfo']['authors'],
          description: result['volumeInfo']['description'],
          cover: result['volumeInfo']['imageLinks']['thumbnail'],
          media_type: 'book'
        )
      else
        interest
      end
    end.select(&:id)
  end
end
