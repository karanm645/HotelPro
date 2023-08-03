# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(username: "karanm645", password: "123")
property = Property.user.create!(name: "Days Inn", street: "123", city: "ABQ", state: "AL", zip_code: 72397, phone_number: "7202222222")
