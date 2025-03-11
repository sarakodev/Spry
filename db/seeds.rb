# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
puts "users destroyed"

marie = User.new(first_name: "Marie", last_name: "Dupont", email: "marie@mail.com", password: "password")

marie.photo.attach(
  io: URI.open('https://kitt.lewagon.com/placeholder/users/cveneziani'),
  filename: 'anyname.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)

marie.save!

puts "created user"

john = User.new(first_name: "John", last_name: "Doe", email: "john@mail.com", password: "password")

john.photo.attach(
  io: URI.open('https://kitt.lewagon.com/placeholder/users/arthur-littm'),
  filename: 'anyname.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)

john.save!

puts "created user"

event = Event.new(name: "Run",
location: "16 Villa Gaudelet",
datetime: Time.now,
photo: "https://res.cloudinary.com/dhyuv86iu/image/upload/v1741344946/development/ifqxh6mcwua0pf4qk9rblye8ims2.jpg",
pace: 6.3,
participants: 4,
user_id: 5)
