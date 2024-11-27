
require "open-uri"
require 'nokogiri'

ShelfInterest.destroy_all
Interest.destroy_all
User.destroy_all

#Seeds for users

james = User.create!(username: "James Smith", email: "jamesSmith@gmail.com", password: "123123")
paula = User.create!(username: "Paula Ortega", email: "paulaOrtega@gmail.com", password: "123123")
frederick = User.create!(username: "Frederick Elias", email: "frederickElias@gmail.com", password: "123123")
rebecca = User.create!(username: "Rebecca Thompson", email: "rebeccaThompson@gmail.com", password: "123123")
mathew = User.create!(username: "Mathew James", email: "mathewJames@gmail.com", password: "123123")
sakura = User.create!(username: "Sakura Itou", email: "sakuraItou@gmail.com", password: "123123")
pedro = User.create!(username: "Pedro Gonzales", email: "pedroGonzales@gmail.com", password: "123123")
elsa = User.create!(username: "Elsa Disney", email: "elsaDisney@gmail.com", password: "123123")
greg = User.create!(username: "Greg Masters", email: "gregMasters@gmail.com", password: "123123")
claudia = User.create!(username: "Claudia Ordonez", email: "claudiaOrdonez@gmail.com", password: "123123")
mason = User.create!(username: "Mason Kamolpechara", email: "masonKamolpechara@gmail.com", password: "123123")
phyuphyu = User.create!(username: "Phyu Phyu", email: "phyuphyuh@gmail.com", password: "123123")


#attach photos to users
users = User.all
gender = 'all'
age = 'all'
ethnicity = 'all'
url = "https://this-person-does-not-exist.com/new?gender=#{gender}&age=#{age}&etnic=#{ethnicity}"

users.map do |user|
  json = URI.open(url).string
  src = JSON.parse(json)['src']
  photo_url = "https://this-person-does-not-exist.com#{src}"
  file = URI.open(photo_url)
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end

#Seeds for books

book1 = Interest.create!(title: "The Little Prince", creator: "Antoine de Saint-Exupéry", publishing_year: 1943, genre: "Science fantasy", media_type: "book")
book2 = Interest.create!(title: "The Giver", creator: "Lois Lowry", publishing_year: 1993, genre: "Science fiction", media_type: "book")
book3 = Interest.create!(title: "When Hitler Stole Pink Rabbit", creator: "Judith Kerr", publishing_year: 1971, genre: "Historical fiction", media_type: "book")

#Seeds for movies

movie1 = Interest.create!(title: "Mr. Nobody", creator: "	Jaco Van Dormael", publishing_year: 2009, genre: "Science fiction", media_type: "movie")
movie2 = Interest.create!(title: "Maboroshi", creator: "Mari Okada", publishing_year: 2023, genre: "Romance", media_type: "movie")
movie3 = Interest.create!(title: "Pan's Labyrinth", creator: "Guillermo Del Toro", publishing_year: 2006, genre: "Fantasy", media_type: "movie")

#Seeds for albums

album1 = Interest.create!(title: "Smile", creator: "Eve", publishing_year: 2020, genre: "J-pop", media_type: "album")
album2 = Interest.create!(title: "Alien Stage", creator: "Vivinos", publishing_year: 2023, genre: "K-pop", media_type: "album")
album3 = Interest.create!(title: "Multitude", creator: "Stromae", publishing_year: 2022, genre: "Pop", media_type: "album")

shelf_interest1 = ShelfInterest.create!(user: james, interest: book1)
shelf_interest2 = ShelfInterest.create!(user: james, interest: book3)
shelf_interest3 = ShelfInterest.create!(user: james, interest: movie2)
shelf_interest4 = ShelfInterest.create!(user: james, interest: movie3)
shelf_interest5 = ShelfInterest.create!(user: james, interest: album1)
