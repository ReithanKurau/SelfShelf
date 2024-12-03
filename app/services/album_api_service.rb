require 'open-uri'

class AlbumApiService
  def initialize(query)
    @query = query
    @url = "https://musicbrainz.org/ws/2/release/?query=artist:#{query}&fmt=json"
  end

  def call
    json = URI.open(@url).read
    results = JSON.parse(json)
    results['releases'].first(10).map do |result|
      interest = Interest.find_by(title: result['title'])
      if interest.nil?
        Interest.create(
          title: result['title'],
          # publishing_year: result['date'].to_i,
          description: 'none',
          cover: "coverartarchive.org/release/#{result['id']}/front",
          media_type: 'album'
        )
      else
        interest
      end
    end.select(&:id)
  end
end
