# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)

the_witcher = netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60)
is_it_cake = netflix.shows.create!(name: "Is It Cake?", genre: "Competition", released: true, episodes: 16, seasons: 2, episode_runtime: 40)
new_girl = hulu.shows.create!(name: "New Girl", genre: "Sitcom", released: true, episodes: 146, seasons: 7, episode_runtime: 30)