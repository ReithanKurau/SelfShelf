require "open-uri"
require 'nokogiri'
require "json"

Comment.destroy_all
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
mason = User.create!(username: "Mason Kamolpechara", email: "masonKamolpechara@gmail.com", password: "123123")
phyuphyu = User.create!(username: "Phyu Phyu", email: "phyuphyuh@gmail.com", password: "123123")
claudia = User.create!(username: "Claudia Ordonez", email: "claudiaOrdonez@gmail.com", password: "123123")


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


url = "https://openlibrary.org/search.json?publisher=penguin"
books_serialized = URI.parse(url).read
books_objs = JSON.parse(books_serialized)
books = books_objs["docs"]

books.each do |book|
  title = book["title"]
  creator = book["author_name"]
  publishing_year = book["first_publish_year"]
  genre = "fiction"
  description = book["first_sentence"]
  isbn = book["isbn"].first

  temp_book = Interest.create!(title: title, creator: creator, publishing_year: publishing_year, genre: genre, description: description, media_type: "book")

  image = URI.open(pic_url = "https://covers.openlibrary.org/b/isbn/#{isbn}-S.jpg")
  temp_book.photo.attach(io: image, filename: 'name.jpg', content_type: 'image/jpg')
end

book1 = Interest.create!(title: "The Little Prince", creator: "Antoine de Saint-Exupéry", publishing_year: 1943, genre: "Science fantasy", media_type: "book")
file = File.open("app/assets/images/Littleprince.jpg")
book1.photo.attach(io: file, filename: "Littleprince.jpg", content_type: "image/jpg")

book2 = Interest.create!(title: "The Giver", creator: "Lois Lowry", publishing_year: 1993, genre: "Science fiction", media_type: "book")
file = File.open("app/assets/images/giver.jpg")
book2.photo.attach(io: file, filename: "giver.jpg", content_type: "image/jpg")

book3 = Interest.create!(title: "When Hitler Stole Pink Rabbit", creator: "Judith Kerr", publishing_year: 1971, genre: "Historical fiction", media_type: "book")

book4 = Interest.create!(title: "Harry Potter", creator: "J.K. Rowling", publishing_year: 1997, genre: "Fantasy", media_type: "book")
file = File.open("app/assets/images/harrypotter.jpg")
book4.photo.attach(io: file, filename: "harrypotter.jpg", content_type: "image/jpg")

book5 = Interest.create!(title: "1q84", creator: "Lois Lowry", publishing_year: 2009, genre: "Science fiction", media_type: "book")
file = File.open("app/assets/images/1q84.png")
book5.photo.attach(io: file, filename: "1q84.png", content_type: "image/png")

book6 = Interest.create!(title: "Cat in the Hat", creator: "Dr. Seuss", publishing_year: 1957, genre: "Historical fiction", media_type: "book")
file = File.open("app/assets/images/catinhat.png")
book6.photo.attach(io: file, filename: "catinhat.png", content_type: "image/png")

book7 = Interest.create!(title: "The Great Gatsby", creator: "F. Scott Fitzgerald", publishing_year: 1925 , genre: "Drama", media_type: "book")
file = File.open("app/assets/images/gatsby.jpg")
book7.photo.attach(io: file, filename: "gatsby.jpg", content_type: "image/jpg")

book8 = Interest.create!(title: "Brave New World", creator: "Aldous Huxley", publishing_year: 1932, genre: "Science fiction", media_type: "book")
file = File.open("app/assets/images/bravenew.jpg")
book8.photo.attach(io: file, filename: "bravenew.jpg", content_type: "image/jpg")

book9 = Interest.create!(title: "To Kill a Mockingbird", creator: "Harper Lee", publishing_year: 1960, genre: "Historical fiction", media_type: "book")
file = File.open("app/assets/images/mockingbird.jpg")
book9.photo.attach(io: file, filename: "mockingbird.jpg", content_type: "image/jpg")

book10 = Interest.create!(title: "Don Quixote", creator: "Cervantes", publishing_year: 1605, genre: "Historical fiction", media_type: "book")
file = File.open("app/assets/images/donq.jpg")
book10.photo.attach(io: file, filename: "donq.jpg", content_type: "image/jpg")

#Seeds for albums

album1 = Interest.create!(title: "Smile", creator: "Eve", publishing_year: 2020, genre: "J-pop", media_type: "album")
album2 = Interest.create!(title: "Alien Stage", creator: "Vivinos", publishing_year: 2023, genre: "K-pop", media_type: "album")
album3 = Interest.create!(title: "Multitude", creator: "Stromae", publishing_year: 2022, genre: "Pop", media_type: "album")
album4 = Interest.create!(title: "Big Willie Style", creator: "Will Smith", publishing_year: 1997, genre: "Hip-Hop", media_type: "album")
album5 = Interest.create(title: "Songs about Jane", creator: "Maroon 5", publishing_year: 2002, genre: "Pop", media_type: "album")

#seeds for a couple shelf_interests

shelf_interest1 = ShelfInterest.create!(user: james, interest: book1)
shelf_interest2 = ShelfInterest.create!(user: james, interest: book3)
shelf_interest3 = ShelfInterest.create!(user: james, interest: movie2)
shelf_interest4 = ShelfInterest.create!(user: james, interest: movie3)
shelf_interest5 = ShelfInterest.create!(user: james, interest: album1)

#Seeds for movies

url = 'https://api.themoviedb.org/3/movie/popular?api_key=7a1ee3663533611fa054763973c22bda'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|
  if Interest.create!(
    cover: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
    title: movie_hash['title'],
    description: movie_hash['overview'],
    publishing_year: movie_hash['release_date'],
    media_type: 'movie',
    creator: 'unknown',
    genre: "unknown"
  )
  else
    puts "failed to create"
  end
end
