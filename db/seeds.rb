# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

User.destroy_all

jeffrey = User.create!(
    username: 'jeffreytseng',
    password: 'password'
)

photo1 = jeffrey.photos.create(title: 'cactus1')
photo_file1 = open("/Users/jeffreytseng/Desktop/photo-rails-backend/app/assets/images/cacti/cactus1.jpg")
photo1.image_file.attach(io: photo_file1, filename: 'cactus1.jpg')
photo1.save!

photo2 = jeffrey.photos.create(title: 'cactus2')
photo_file2 = open("/Users/jeffreytseng/Desktop/photo-rails-backend/app/assets/images/cacti/cactus2.jpg")
photo2.image_file.attach(io: photo_file2, filename: 'cactus2.jpg')
photo2.save!

photo3 = jeffrey.photos.create(title: 'cactus3')
photo_file3 = open("/Users/jeffreytseng/Desktop/photo-rails-backend/app/assets/images/cacti/cactus3.jpg")
photo3.image_file.attach(io: photo_file3, filename: 'cactus3.jpg')
photo3.save!

photo4 = jeffrey.photos.create(title: 'cactus4')
photo_file4 = open("/Users/jeffreytseng/Desktop/photo-rails-backend/app/assets/images/cacti/cactus4.jpg")
photo4.image_file.attach(io: photo_file4, filename: 'cactus4.jpg')
photo4.save!
