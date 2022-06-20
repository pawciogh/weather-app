# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# standard user    
# user = User.create!(email: 'standard@email.com', password: 'secret', password_confirmation: 'secret')
# admin user
user = User.create!(email: 'admin@email.com', password: 'secret', password_confirmation: 'secret', admin: true)


