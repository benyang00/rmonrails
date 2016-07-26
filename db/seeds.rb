# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'user'
require 'product'
require 'review'
require 'faker'

(1..100).each do |i|
  User.create(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  address: "#{Faker::Address.street_address} #{Faker::Address.city} #{Faker::Address.state} #{Faker::Address.zip_code} #{Faker::Address.country}",
  password: Faker::Internet.password,
  cc_number: Faker::Business.credit_card_number
  )
end

(1..100).each do |j|
  Product.create(
  name: Faker::Commerce.product_name,
  price: Faker::Commerce.price
  )
end

(1..25).each do |k|
  Review.create(
  user_id: User.pluck(:id).sample,
  product_id: Product.pluck(:id).sample,
  content: Faker::ChuckNorris.fact
  )
end
