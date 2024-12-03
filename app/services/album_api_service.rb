require 'open-uri'
require 'rspotify'

class AlbumApiService
  def initialize(query)
    RSpotify.authenticate("747f5b890d084d359eefc607c11abf6c", "64e55cb178104d2994df3eed9894af47")
    @query = query
    # @url = "https://musicbrainz.org/ws/2/release?query=artist:#{query}&fmt=json"
  end

  def call
  #   json = URI.open(@url).read
  #   results = JSON.parse(json)
  #   results['releases'].first(10).map do |result|
  #     interest = Interest.find_by(title: result['title'])
  #     if interest.nil?
  #       Interest.create(
  #         title: result['title'],
  #         # publishing_year: result['date'].to_i,
  #         description: 'none',
  #         cover: "coverartarchive.org/release/#{result['id']}/front",
  #         media_type: 'album'
  #       )
      
    artists = RSpotify::Artist.search(@query)
    artist = artists.first
    albums = artist.albums 
    albums.map do |album|
      interest = Interest.find_by(title: album.name)
      if interest.nil?
        Interest.create(
          title: album.name,
          cover: album.images[0]["url"],
          media_type: "album",
          publishing_year: album.release_date[0..3].to_i
          )
      else
        interest
      end
    end.select(&:id)
  end
end