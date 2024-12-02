require 'open-uri'

class MovieApiService
  def initialize(query)
    @query = query
    @url = "https://api.themoviedb.org/3/search/movie?query=#{query}&api_key=7a1ee3663533611fa054763973c22bda"
  end

  def call
    json = URI.open(@url).read
    results = JSON.parse(json)
    results['results'].map do |result|
      interest = Interest.find_by(title: result['title'], publishing_year: result['release_date']&.split('-')&.first)
      if interest.nil?
        Interest.create(
          title: result['title'],
          publishing_year: result['release_date']&.split('-')&.first,
          description: result['overview'],
          cover: "https://image.tmdb.org/t/p/w200#{result['poster_path']}",
          media_type: 'movie'
        )
      else
        interest
      end
    end.select(&:id)
  end
end
# MovieApiService.new(params[:query]).call
