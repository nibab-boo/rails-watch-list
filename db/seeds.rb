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

puts "seeding"
movies = []

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
5.times do 
  list = List.create(name: Faker::Name.first_name)
  (0...4).to_a.each do |x|
    book = Bookmark.new(
      comment: Faker::Movies::BackToTheFuture.quote,
      movie: movies.sample,
      list: list
    )
    book.save if book.valid?
  end
end
puts "done"