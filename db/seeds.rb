# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
User.destroy_all

puts "seeding"
movies = []
users = []

users << User.create!(
  email: "babin1@gmail.com",
  password: "123456"
)
users << User.create!(
  email: "bohora1@gmail.com",
  password: "123456"
)

p users

url = "http://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
movies_json = JSON.parse(user_serialized)
movies_json["results"].each do |movie|
  movies << Movie.create!(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
    rating: movie["vote_average"]
    )
end
n = 1
5.times do 
  list = List.new(
    name: Faker::Name.first_name,
    user: users.sample
    )
    file = URI.open("https://picsum.photos/500/300?random=#{n}")
  list.photo.attach(io: file, filename: 'movie.png', content_type: 'image/png');
  (0...4).to_a.each do |x|+
    book = Bookmark.new(
      comment: Faker::Movies::BackToTheFuture.quote,
      movie: movies.sample,
      list: list
    )
    book.save if book.valid?
  end
  n += 1
end
puts "done"