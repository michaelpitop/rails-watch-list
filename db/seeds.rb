# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
URL = 'http://tmdb.lewagon.com/movie/top_rated'

movies = JSON.parse(URI.parse(URL).open.read)

movies['results'].take(10).each do |movie|
  movie = Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  )
end
