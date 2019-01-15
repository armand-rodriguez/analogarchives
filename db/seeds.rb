# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: 'adminfirst', last_name: 'adminlast', email: 'admin@admin.com', password: 'asdasd', password_confirmation: 'asdasd', admin: true, is_guest: false)
User.create!(first_name: 'user1first', last_name: 'user2last', email: 'testuser2@test.com', password: 'asdasd', password_confirmation: 'asdasd', admin: false, is_guest: false)
User.create!(first_name: 'user1first', last_name: 'user2last', email: 'asd@asd.com', password: 'asdasd', password_confirmation: 'asdasd', admin: false, is_guest: false)
Product.create!(artist: 'test artist 1', album: 'test album 1', description: 'this is a test description for artist 1.', price: 420)
Product.create!(artist: 'test artist 2', album: 'test album 2', description: 'this is a test description for artist 2.', price: 200)
Product.create!(artist: 'test artist 3', album: 'test album 3', description: 'this is a test description for artist 3.', price: 550)
Product.create!(artist: 'test artist 4', album: 'test album 4', description: 'this is a test description for artist 4.', price: 900)
Product.create!(artist: 'test artist 5', album: 'test album 5', description: 'this is a test description for artist 5.', price: 680)
Product.create!(artist: 'test artist 6', album: 'test album 6', description: 'this is a test description for artist 6.', price: 375)
