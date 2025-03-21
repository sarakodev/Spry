# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Message.destroy_all
puts "msg detroyed"
Chatroom.destroy_all
puts "chatrooms destroyed"
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
  location: "Rue de Rivoli, Paris",
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
  location: "Jardin-des-Plantes, Paris",
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
  location: "Ile Saint-Louis, Paris",
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
  location: "Musée d'Orsay, Paris",
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
  location: "35 Bd de Courcelles, 75008 Paris",
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



base_time += 2.days # 14 days later

event = Event.create(
  name: "Seine Sunrise Run",
  location: "Quai de la Tournelle",
  datetime: base_time.change(hour: 6, min: 45),
  pace: 5.8,
  participants: 4,
  user: User.fourth,
  description: "A peaceful run along the Seine at sunrise.",
  kilometers: 7.0
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1742204011/15_uvyxcl.png'), filename: 'run11.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 3.days # 17 days later

event = Event.create(
  name: "Fun Run",
  location: "Cour Napoléon",
  datetime: base_time.change(hour: 20, min: 0),
  pace: 6.2,
  participants: 5,
  user: User.fifth,
  description: "A night run around the Louvre with city lights.",
  kilometers: 6.5
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1742204011/14_ejw532.png'), filename: 'run12.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 4.days # 21 days later

event = Event.create(
  name: "Morning Dash",
  location: "Parc des Buttes-Chaumont",
  datetime: base_time.change(hour: 7, min: 15),
  pace: 5.3,
  participants: 6,
  user: User.last,
  description: "A quick-paced morning run in the Buttes-Chaumont.",
  kilometers: 5.8
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1742204012/17_aa4to8.png'), filename: 'run13.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 2.days # 23 days later

event = Event.create(
  name: "Eiffel Tower Sprint",
  location: "Champ de Mars, Paris",
  datetime: base_time.change(hour: 18, min: 30),
  pace: 4.9,
  participants: 8,
  user: User.second,
  description: "Fast intervals near the Eiffel Tower.",
  kilometers: 6.2
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1742204012/18_ak7g4q.png'), filename: 'run14.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 5.days # 28 days later

event = Event.create(
  name: "Track Running",
  location: "1 Avenue Pierre De Coubertin, Paris",
  datetime: DateTime.new(2025,3,23.5),
  pace: 4.5,
  participants: 5,
  user: User.second,
  description: "Interval training, all levels are welcome.",
  kilometers: 8.0
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1742204012/20_oyfeii.png'), filename: 'run15.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 3.days # 31 days later

event = Event.create(
  name: "Hill Climb Challenge",
  location: "Butte Montmartre, Paris",
  datetime: base_time.change(hour: 17, min: 45),
  pace: 7.1,
  participants: 7,
  user: User.third,
  description: "Steep hill sprints for strength and endurance.",
  kilometers: 5.0
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1742204580/Design_sans_titre-5_wcmiix.png'), filename: 'run16.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 6.days # 37 days later

event = Event.create(
  name: "Sunset River Run",
  location: "Pont Alexandre III",
  datetime: base_time.change(hour: 19, min: 0),
  pace: 6.0,
  participants: 6,
  user: User.fourth,
  description: "A scenic sunset run along the Seine.",
  kilometers: 9.2
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1741864223/11_ezrka5.png'), filename: 'run17.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 2.days # 39 days later

event = Event.create(
  name: "Park Trail Run",
  location: "Parc de Sceaux",
  datetime: base_time.change(hour: 8, min: 30),
  pace: 5.9,
  participants: 9,
  user: User.fifth,
  description: "Trail running session in a natural park.",
  kilometers: 10.0
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1742204012/19_mshbip.png'), filename: 'run18.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 4.days # 43 days later

event = Event.create(
  name: "Marathon Training",
  location: "Bois de Boulogne, Paris",
  datetime: base_time.change(hour: 7, min: 0),
  pace: 5.6,
  participants: 10,
  user: User.last,
  description: "Long-distance run for marathon prep.",
  kilometers: 18.0
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1742204012/21_n2wc0k.png'), filename: 'run19.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

base_time += 1.week # 50 days later

event = Event.create(
  name: "Weekly Track",
  location: "Stade Alain Mimoun",
  datetime: base_time.change(hour: 19, min: 30),
  pace: 4.5,
  participants: 4,
  user: User.first,
  description: "Intense sprint session for speed improvement.",
  kilometers: 4.5
)
event.photo.attach(io: URI.open('https://res.cloudinary.com/dhyuv86iu/image/upload/v1742204013/22_eremtt.png'), filename: 'run20.jpg', content_type: 'image/jpg')
event.save!
puts "created event"

Booking.destroy_all
puts "bookings destroyed"

Participation.destroy_all
puts "participations destroyed"

Challenge.destroy_all
puts "challenges destroyed"

challenge = Challenge.create(
  title: "Run from Paris to Marseille together",
  category: "Distance challenge",
  team_name: "Team Chacha 🐈",
  start_point: "Paris, France",
  end_point: "Marseille, France",
  user_id: User.first.id,
  created_at: 4.month.ago
)
challenge = Challenge.create(
  title: "Run from Paris to Nantes together",
  category: "Distance challenge",
  team_name: "Team Wagon 🚂",
  start_point: "Paris, France",
  end_point: "Nantes, France",
  user_id: User.first.id,
  created_at: 4.month.ago
)
challenge.save!
puts "created a distance challenge"

participation = Participation.create(
  distance: 100,
  user_id: User.first.id,
  challenge_id: Challenge.first.id
)
participation = Participation.create(
  distance: 100,
  user_id: User.second.id,
  challenge_id: Challenge.first.id
)
participation = Participation.create(
  distance: 100,
  user_id: User.third.id,
  challenge_id: Challenge.first.id
)
participation = Participation.create(
  distance: 100,
  user_id: User.fourth.id,
  challenge_id: Challenge.first.id
)
participation = Participation.create(
  distance: 0,
  user_id: User.first.id,
  challenge_id: Challenge.second.id
)
participation = Participation.create(
  distance: 0,
  user_id: User.second.id,
  challenge_id: Challenge.second.id
)
participation = Participation.create(
  distance: 0,
  user_id: User.third.id,
  challenge_id: Challenge.second.id
)
participation = Participation.create(
  distance: 0,
  user_id: User.fourth.id,
  challenge_id: Challenge.second.id
)
participation.save!
puts "created a participation"

challenge = Challenge.create(
  title: "The Office Sprint",
  category: "Duration challenge",
  team_name: "Team Michael Scott",
  duration: 150.0,
  completion: 0.22,
  user_id: User.first.id,
  created_at: 4.month.ago
)

challenge = Challenge.create(
  title: "Fleabag Challenge",
  category: "Duration challenge",
  team_name: "Team Phoebe",
  duration: 156.0,
  completion: 0.32,
  user_id: User.first.id,
  created_at: 4.month.ago
)
challenge.save!
puts "created a duration challenge"


participation = Participation.create(
  duration: 0,
  user_id: User.first.id,
  challenge_id: Challenge.third.id
)

participation = Participation.create(
  duration: 0,
  user_id: User.first.id,
  challenge_id: Challenge.fourth.id
)

participation = Participation.create(
  duration: 0,
  user_id: User.second.id,
  challenge_id: Challenge.third.id
)

participation = Participation.create(
  duration: 0,
  user_id: User.second.id,
  challenge_id: Challenge.fourth.id
)

participation = Participation.create(
  duration: 0,
  user_id: User.third.id,
  challenge_id: Challenge.fourth.id
)

participation = Participation.create(
  duration: 0,
  user_id: User.third.id,
  challenge_id: Challenge.third.id
)

participation.save!
puts "created a participation"
puts "all done, congratulations!"
