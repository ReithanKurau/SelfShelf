require "open-uri"
require 'nokogiri'
require "json"

url = 'https://api.themoviedb.org/3/movie/popular?api_key=7a1ee3663533611fa054763973c22bda'

response = JSON.parse(URI.open(url).read)


response['results'].each do |movie_hash|
  puts movie_hash['release_date']
  Interest.create!(
    cover: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
    title: movie_hash['title'],
    description: movie_hash['overview'],
    publishing_year: movie_hash['release_date'],
    media_type: 'movie',
    creator: 'unknown'
  )
end