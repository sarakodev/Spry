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
  filename: 'paul.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg', # use the mime type of the attached file here
)

paul.save!

puts "created user"

julie = User.new(first_name: "Julie", last_name: "Durand", email: "julie@mail.com", password: "password")

julie.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741865840/jake-nackos-IF9TK5Uy-KI-unsplash_2_hecgwz.jpg'),
  filename: 'julie.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg', # use the mime type of the attached file here
)

julie.save!

puts "created user"

ben = User.new(first_name: "Ben", last_name: "Doe", email: "ben@mail.com", password: "password")

ben.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741948408/ben-den-engelsen-YUu9UAcOKZ4-unsplash_fobonl.jpg'),
  filename: 'ben.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg', # use the mime type of the attached file here
)

ben.save!

puts "created user"


chloe = User.new(first_name: "Chloe", last_name: "Torey", email: "chloe@mail.com", password: "password")

chloe.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741950471/barbora-polednova-dY7Q-sl77L4-unsplash_tueoty.jpg'),
  filename: 'chloe.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg', # use the mime type of the attached file here
)

chloe.save!

puts "created user"


Event.destroy_all

puts "events destroyed"

require 'date'

base_time = DateTime.now.next_day(1).change(hour: 6, min: 30) # Tomorrow at 6:30 AM

event = Event.new(name: "Morning Sprint",
  location: "Champs-Élysées, Paris",
  datetime: base_time,
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

base_time += 12.hours # Tomorrow at 6:30 PM

event = Event.new(name: "Sunset Jog",
  location: "Montmartre, Paris",
  datetime: base_time,
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

base_time += 2.days # Two days later at 6:30 PM

event = Event.new(name: "Speed Training",
  location: "Parc de Montsouris",
  datetime: base_time,
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

base_time += 3.days # Five days from now

event = Event.new(name: "Long Distance Challenge",
  location: "Rue de Rivoli",
  datetime: base_time,
  pace: 6.0,
  participants: 8,
  user: User.fourth,
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

base_time += 2.days # One week from now

event = Event.new(name: "Park Loops",
  location: "Parc des Tuileries",
  datetime: base_time,
  pace: 6.2,
  participants: 3,
  user: User.fifth,
  description: "Multiple loops in a beautiful park setting.",
  kilometers: 5.0)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864221/2_f0cq9g.png'),
  filename: 'run9.jpg',
  content_type: 'image/jpg'
)

event.save!
puts "created event"

base_time += 7.days # Two weeks from now

event = Event.new(name: "Social Sunday Run",
  location: "Ile Saint-Louis",
  datetime: base_time,
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

base_time += 3.days # 17 days from now

event = Event.new(name: "Louvre Run",
  location: "Musée d'Orsay",
  datetime: base_time,
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

base_time += 5.days # 22 days from now

event = Event.new(name: "Mountain Run",
  location: "Ascain",
  datetime: base_time,
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

base_time += 4.days # 26 days from now

event = Event.new(name: "Marathon Prep",
  location: "Parc Monceau",
  datetime: base_time,
  pace: 5.5,
  participants: 7,
  user: User.third,
  description: "Steady-paced preparation for marathon runners.",
  kilometers: 15.0)

event.photo.attach(
  io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864221/9_owkh30.png'),
  filename: 'run7.jpg',
  content_type: 'image/jpg'
)

event.save!
puts "created event"

Booking.destroy_all

puts "bookings destroyed"


e = Booking.new(event_id: Event.first.id, user_id: User.fourth.id, status: 'Pending')
e.save
puts 'created a booking'

f = Booking.new(event_id: Event.second.id, user_id: User.fifth.id, status: 'Accepted')
f.save
puts 'created a booking'

g = Booking.new(event_id: Event.third.id, user_id: User.last.id, status: 'Declined')
g.save
puts 'created a booking'

puts "all done!"
