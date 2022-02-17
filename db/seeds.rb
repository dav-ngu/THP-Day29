# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

DatabaseCleaner.clean_with(:truncation) #permet d'éviter de faire tous les destroys all et regénère les id à partir de 1

cities = []
gossips = []
join_gossip_tags = []
tags = []
users = []

puts "Cities incrementation"
12.times do |x|
    city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
    cities << city
end
puts "Users incrementation"
12.times do |x|
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, email: Faker::Internet.safe_email, age: rand(18..99), password: "TGP_2022", city_id: cities[rand(0..11)].id)
    users << user
end

puts "Gossips incrementation"
12.times do |x|
    gossip = Gossip.create(title: Faker::Movies::StarWars.character, content: Faker::Quote.yoda, user_id: users[rand(0..11)].id)
    gossips << gossip
end

puts "Tags incrementation"
12.times do |x|
    tag = Tag.create(title: Faker::Book.genre)
    tags << tag
end

puts "JoinGossipsTags incrementation"
12.times do |x|
    join = JoinGossipTag.create(gossip_id: gossips[rand(0..11)].id, tag_id: tags[rand(0..11)].id)
    join_gossip_tags << join
end