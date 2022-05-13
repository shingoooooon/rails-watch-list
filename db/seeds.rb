# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'
# require 'faker'

# url = 'http://tmdb.lewagon.com/movie/top_rated'
# response = JSON.parse(URI.open(url).read)

# puts "Cleaning the DB..."
# Movie.destroy_all

# puts "Creating movies..."
# response['results'].each do |movie_hash|
#   Movie.create!(
#     title: Faker::Movie.title,
#     overview: "#{Faker::Movie.title}: #{Faker::Movie.quote}",
#     poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
#     rating: Faker::Number.decimal(l_digits: 1)
#   )
# end
# puts "...created #{Movie.count} movies."

require 'open-uri'
Bookmark.destroy_all
Movie.destroy_all
# List.destroy_all

# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|

  Movie.create(
    title: movie_hash["title"],
    overview: movie_hash["overview"],
    rating: movie_hash["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path']
  )
end

puts "...created #{Movie.count} movies."
