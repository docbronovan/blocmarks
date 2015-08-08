# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
 
 # Create Topics
 10.times do
   Topic.create!(
     name:  Faker::Lorem.word,
   )
 end
 topics = Topic.all
 
 # Create bookmarks
 30.times do
   Bookmark.create!(
     topic: topics.sample,
     url: "http://www." + Faker::Lorem.word + ".com"
   )
 end
 
 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Url.count} urls created"