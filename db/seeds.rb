# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# User.destroy_all
# Tweet.destroy_all

# AdminUser.destroy_all

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email, 
    password: '123123',
    photo: Faker::Avatar.image 
  )
end

users = User.all

50.times do
  Tweet.create(
    content: Faker::Lorem.paragraph_by_chars(rand(280)),
    user: users.sample
  )
end

AdminUser.create!(email: 'tomas.konig@gmail.com', password: 'buenas', password_confirmation: 'password') 
#if Rails.env.development?