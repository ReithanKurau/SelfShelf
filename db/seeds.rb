require "open-uri"
require 'nokogiri'

ArtClass.destroy_all
User.destroy_all
Reservation.destroy_all

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
