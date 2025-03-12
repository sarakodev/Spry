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
  filename: 'marie.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)

marie.save!

puts "created user"

john = User.new(first_name: "John", last_name: "Doe", email: "john@mail.com", password: "password")

john.photo.attach(
  io: URI.open('https://kitt.lewagon.com/placeholder/users/arthur-littm'),
  filename: 'john.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)

john.save!

Event.destroy_all

puts "events destroyed"

puts "created user"

event = Event.new(name: "Run",
location: "16 Villa Gaudelet",
datetime: Time.now,
pace: 6.3,
participants: 4,
user: User.first)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741776937/Design_sans_titre-5_mrb34s.png'),
  filename: 'run1.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)
event.save!

puts "created event"


event = Event.new(name: "Run récup",
  location: "Bastille",
  datetime: Time.now,
  pace: 7.0,
  participants: 2,
  user: User.last)

  event.photo.attach(
    io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741776979/miguel-a-amutio-Y0woUmyxGrw-unsplash_j6vhzh.jpg'),
    filename: 'run2.jpg', # use the extension of the attached file here (found at the end of the url)
    content_type: 'image/jpg' # use the mime type of the attached file here
  )

event.save!

puts "created event"
