class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :events_as_participant, through: :bookings, source: :event

  # has_many :bookings_as_event_organizer, through: :events, source: :bookings
  # has_many :bookings_as_event_seeker, class_name: "Booking", dependent: :destroy

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
end
