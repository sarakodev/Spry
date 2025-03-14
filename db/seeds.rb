User.destroy_all
puts "users destroyed"

# User creation logic (remains unchanged)
marie = User.create(first_name: "Marie", last_name: "Dupont", email: "marie@mail.com", password: "password")
marie.photo.attach(io: URI.open('https://kitt.lewagon.com/placeholder/users/cveneziani'), filename: 'marie.jpg', content_type: 'image/jpg')
marie.save!

john = User.create(first_name: "John", last_name: "Doe", email: "john@mail.com", password: "password")
john.photo.attach(io: URI.open('https://kitt.lewagon.com/placeholder/users/arthur-littm'), filename: 'john.jpg', content_type: 'image/jpg')
john.save!

paul = User.create(first_name: "Paul", last_name: "Marlet", email: "paul@mail.com", password: "password")
paul.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741865842/imansyah-muhamad-putera-n4KewLKFOZw-unsplash_jrnufh.jpg'), filename: 'paul.jpg', content_type: 'image/jpg')
paul.save!

julie = User.create(first_name: "Julie", last_name: "Durand", email: "julie@mail.com", password: "password")
julie.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741865840/jake-nackos-IF9TK5Uy-KI-unsplash_2_hecgwz.jpg'), filename: 'julie.jpg', content_type: 'image/jpg')
julie.save!

ben = User.create(first_name: "Ben", last_name: "Doe", email: "ben@mail.com", password: "password")
ben.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741948408/ben-den-engelsen-YUu9UAcOKZ4-unsplash_fobonl.jpg'), filename: 'ben.jpg', content_type: 'image/jpg')
ben.save!

chloe = User.create(first_name: "Chloe", last_name: "Torey", email: "chloe@mail.com", password: "password")
chloe.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741950471/barbora-polednova-dY7Q-sl77L4-unsplash_tueoty.jpg'), filename: 'chloe.jpg', content_type: 'image/jpg')
chloe.save!

puts "created users"

Event.destroy_all
puts "events destroyed"

require 'date'

base_time = DateTime.now.next_day(1).change(hour: 6, min: 30) # Tomorrow at 6:30 AM

event = Event.create(
  name: "Morning Sprint",
  location: "Champs-Élysées, Paris",
  datetime: base_time,
  pace: 5.2,
  participants: 3,
  user: User.first,
  description: "Fast-paced run to start the day.",
  kilometers: 6.0
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864219/4_pffgmo.png'), filename: 'run1.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 5.hours # Adjusted for a late morning session, now 11:30 AM

event = Event.create(
  name: "Midday Jog",
  location: "Montmartre, Paris",
  datetime: base_time,
  pace: 6.0,
  participants: 5,
  user: User.second,
  description: "Midday jog with scenic views.",
  kilometers: 7.5
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864220/6_tjsg0d.png'), filename: 'run2.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 1.day # One day later

event = Event.create(
  name: "Evening Run",
  location: "Parc Montsouris",
  datetime: base_time.change(hour: 18, min: 0), # Evening time
  pace: 4.8,
  participants: 6,
  user: User.third,
  description: "Interval sprints and endurance boost.",
  kilometers: 5.2
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864220/1_ksvjo5.png'), filename: 'run3.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 3.days # 3 days later

event = Event.create(
  name: "Nighttime Challenge",
  location: "Rue de Rivoli",
  datetime: base_time.change(hour: 19, min: 30), # Late evening
  pace: 6.0,
  participants: 8,
  user: User.fourth,
  description: "Steady long-distance run by the river.",
  kilometers: 12.0
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864221/7_ybgyug.png'), filename: 'run4.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 2.days # 5 days from now

event = Event.create(
  name: "Early Morning Loop",
  location: "Parc des Tuileries",
  datetime: base_time.change(hour: 7, min: 0), # Early morning
  pace: 6.2,
  participants: 3,
  user: User.fifth,
  description: "Multiple loops in a beautiful park setting.",
  kilometers: 5.0
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864221/2_f0cq9g.png'), filename: 'run9.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 1.week # 1 week later

event = Event.create(
  name: "Social Sunday Run",
  location: "Ile Saint-Louis",
  datetime: base_time.change(hour: 10, min: 30), # Sunday morning
  pace: 6.7,
  participants: 6,
  user: User.last,
  description: "Casual run with friendly conversation.",
  kilometers: 7.8
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741865388/Design_sans_titre-5_do4euk.png'), filename: 'run10.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 4.days # 4 days later

event = Event.create(
  name: "Museum Run",
  location: "Musée d'Orsay",
  datetime: base_time.change(hour: 8, min: 0), # Early morning again
  pace: 6.3,
  participants: 10,
  user: User.first,
  description: "Run through the city museums.",
  kilometers: 9.5
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864220/8_xitzvn.png'), filename: 'run6.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 3.days # 7 days later

event = Event.create(
  name: "Mountain Run",
  location: "Ascain",
  datetime: base_time.change(hour: 17, min: 30), # Late afternoon
  pace: 7.0,
  participants: 10,
  user: User.second,
  description: "Trail running with 800m elevation gain.",
  kilometers: 15
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864222/12_pgehf9.png'), filename: 'run6.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 5.days # 12 days later

event = Event.create(
  name: "Marathon Prep",
  location: "Parc Monceau",
  datetime: base_time.change(hour: 6, min: 30), # Early morning
  pace: 5.5,
  participants: 7,
  user: User.third,
  description: "Steady-paced preparation for marathon runners.",
  kilometers: 15.0
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864221/9_owkh30.png'), filename: 'run7.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

Booking.destroy_all
puts "bookings destroyed"

# Booking creation logic (remains unchanged)
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
