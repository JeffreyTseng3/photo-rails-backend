# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

User.destroy_all
Photo.destroy_all 
Comment.destroy_all
CollectionItem.destroy_all


jeffrey = User.create!(
    username: 'jeffreytseng',
    password: 'password'
)



photo1 = jeffrey.photos.create!(
    title:'cactus'
)



