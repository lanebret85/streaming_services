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

