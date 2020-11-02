# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

fridge = User.create!(
  username:               "Fridge",
  email:                  "azerty@azert.com",
  password:               "azerty",
  password_confirmation:  "azerty"
)

puts "#{User.count} users created"
# --------------------------------

firstmeme = Meme.create!(
  title: "seedmeme",
  source: "seed",
  tag_list: ["fun", "world"],
  usertag_list: "usertagtest",
  user: fridge
  )


puts "#{Meme.count} memes created"
# --------------------------------
