class Event < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  has_many :bookings, dependent: :destroy
  has_many :pending_bookings, -> { where status: "Pending" }, class_name: 'Booking'
  has_many :accepted_bookings, -> { where status: 'Accepted' }, class_name: 'Booking'
  has_many :event_participants, through: :accepted_bookings, source: :user

  validates :name, presence: true
  validates :location, presence: true
  validates :datetime, presence: true
  validates :pace, presence: true
  validates :participants, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
