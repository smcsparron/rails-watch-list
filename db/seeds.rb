# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# The movie database API seed

puts "Deleting Movie/List/Bookmark data ...."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts "Generating new Movie/List/Bookmark data ..."

url = "https://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_key%3E"
list_serialized = URI.open(url).read
list = JSON.parse(list_serialized)

m1 = Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
m2 = Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
m3 = Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
m4 = Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
l1 = List.create(name: "Horror")
l2 = List.create(name: "Thriller")
l3 = List.create(name: "My Favourite Movies")
Bookmark.create(comment: "The greatest escape movie ever", list_id: l3.id, movie_id: m2.id )
Bookmark.create(comment: "A Love movie for the ages", list_id: l3.id, movie_id: m3.id )
Bookmark.create(comment: "Absolute Trash Movie", list_id: l1.id, movie_id: m4.id )

list['results'].each do |element|
  movie = Movie.create(
    title: element['title'],
    overview: element['overview'],
    rating: element['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{element['poster_path']}"
  )
  puts "Title: #{movie.title}"
  puts "Rating: #{movie.rating}"
  puts "Poster: #{movie.poster_url}"
  puts '-----------------------------------------------------'
end


# Faker seed below
# require 'faker'

# puts 'Creating database'
# Movie.destroy_all

# puts 'Creating Movies...'

# 10.times do
#   movie = Movie.create(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     rating: rand(1..10)
#   )
#   puts "Title: #{movie.title}"
#   puts "Overview: #{movie.overview}"
#   puts "Rating: #{movie.rating}"
#   puts '-----------------------------------------------------'
# end

# puts 'Finished!'
