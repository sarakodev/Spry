# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
puts "users destroyed"

marie = User.new(first_name: "Marie", last_name: "Dupont", email: "marie@mail.com", password: "password")

marie.photo.attach(
  io: URI.open('https://kitt.lewagon.com/placeholder/users/cveneziani'),
  filename: 'marie.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg', # use the mime type of the attached file here
)

marie.save!

puts "created user"

john = User.new(first_name: "John", last_name: "Doe", email: "john@mail.com", password: "password")

john.photo.attach(
  io: URI.open('https://kitt.lewagon.com/placeholder/users/arthur-littm'),
  filename: 'john.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg', # use the mime type of the attached file here
)

john.save!

puts "created user"

paul = User.new(first_name: "Paul", last_name: "Marlet", email: "paul@mail.com", password: "password")

paul.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741865842/imansyah-muhamad-putera-n4KewLKFOZw-unsplash_jrnufh.jpg'),
  filename: 'john.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg', # use the mime type of the attached file here
)

paul.save!

puts "created user"

julie = User.new(first_name: "Julie", last_name: "Durand", email: "julie@mail.com", password: "password")

julie.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741865840/jake-nackos-IF9TK5Uy-KI-unsplash_2_hecgwz.jpg'),
  filename: 'john.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg', # use the mime type of the attached file here
)

julie.save!

puts "created user"

Event.destroy_all

puts "events destroyed"

event = Event.new(name: "Morning Sprint",
  location: "Champs-Élysées, Paris",
  datetime: Time.now,
  pace: 5.2,
  participants: 3,
  user: User.first,
  description: "Fast-paced run to start the day.",
  kilometers: 6.0,
)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864219/4_pffgmo.png'),
  filename: 'run1.jpg',
  content_type: 'image/jpg',
)

event.save!
puts "created event"

event = Event.new(name: "Sunset Jog",
  location: "Montmartre, Paris",
  datetime: Time.now,
  pace: 6.5,
  participants: 5,
  user: User.second,
  description: "Scenic evening jog with a view.",
  kilometers: 7.5,
)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864220/6_tjsg0d.png'),
  filename: 'run2.jpg',
  content_type: 'image/jpg',
)

event.save!
puts "created event"

event = Event.new(name: "Speed Training",
  location: "Parc de Montsouris",
  datetime: Time.now,
  pace: 4.8,
  participants: 6,
  user: User.third,
  description: "Interval sprints and endurance boost.",
  kilometers: 5.2,
)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864220/1_ksvjo5.png'),
  filename: 'run3.jpg',
  content_type: 'image/jpg',
)

event.save!
puts "created event"


event = Event.new(name: "Long Distance Challenge",
  location: "Rue de Rivoli",
  datetime: Time.now,
  pace: 6.0,
  participants: 8,
  user: User.last,
  description: "Steady long-distance run by the river.",
  kilometers: 12.0,
)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864221/7_ybgyug.png'),
  filename: 'run4.jpg',
  content_type: 'image/jpg',
)

event.save!
puts "created event"

event = Event.new(name: "Park Loops",
  location: "Parc des Tuileries",
  datetime: Time.now,
  pace: 6.2,
  participants: 3,
  user: User.first,
  description: "Multiple loops in a beautiful park setting.",
  kilometers: 5.0)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864221/2_f0cq9g.png'),
  filename: 'run9.jpg',
  content_type: 'image/jpg'
)

event.save!
puts "created event"

event = Event.new(name: "Social Sunday Run",
  location: "Ile Saint-Louis",
  datetime: Time.now,
  pace: 6.7,
  participants: 6,
  user: User.last,
  description: "Casual run with friendly conversation.",
  kilometers: 7.8)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741865388/Design_sans_titre-5_do4euk.png'),
  filename: 'run10.jpg',
  content_type: 'image/jpg'
)

event.save!
puts "created event"

event = Event.new(name: "Louvre Run",
  location: "Musée d'Orsay",
  datetime: Time.now,
  pace: 6.3,
  participants: 10,
  user: User.first,
  description: "Run through the city museums.",
  kilometers: 9.5)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864220/8_xitzvn.png'),
  filename: 'run6.jpg',
  content_type: 'image/jpg'
)

event.save!
puts "created event"


event = Event.new(name: "Mountain run",
  location: "Ascain",
  datetime: Time.now,
  pace: 7.0,
  participants: 10,
  user: User.second,
  description: "Trail running with 800m elevation gain..",
  kilometers: 15)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864222/12_pgehf9.png'),
  filename: 'run6.jpg',
  content_type: 'image/jpg'
)

event.save!
puts "created event"


event = Event.new(name: "Marathon Prep",
  location: "Parc Monceau",
  datetime: Time.now,
  pace: 5.5,
  participants: 7,
  user: User.first,
  description: "Steady-paced preparation for marathon runners.",
  kilometers: 15.0)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864221/9_owkh30.png'),
  filename: 'run7.jpg',
  content_type: 'image/jpg'
)

event.save!
puts "created event"

puts "all done!"


e = Booking.new(event_id: Event.first.id, user_id: User.first.id, status: 'Pending')
e.save
puts 'created a booking'

f = Booking.new(event_id: Event.second.id, user_id: User.second.id, status: 'Accepted')
f.save
puts 'created a booking'

g = Booking.new(event_id: Event.second.id, user_id: User.second.id, status: 'Declined')
g.save
puts 'created a booking'
