# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#create users
3.times do
 user = User.new(
   name:     Faker::Name.name,
   email:    Faker::Internet.email,
   password: Faker::Lorem.characters(10)
 )
 user.skip_confirmation!
 user.save!
end

brock = User.new(
  name:     'brock',
  email: 'brockdonovan@gmail.com',
  password: 'helloworld'
)
brock.skip_confirmation!
brock.save!

users = User.all

# Create Topics
10.times do
 Topic.create!(
   title:  Faker::Lorem.word,
   user_id: users.sample.id
 )
end
topics = Topic.all

# Create bookmarks
30.times do
 Bookmark.create!(
   topic: topics.sample,
   url: "http://www." + Faker::Lorem.word + ".com",
   user_id: users.sample.id
 )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} urls created"