class Event < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  has_many :bookings, dependant: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :datetime, presence: true
  validates :pace, presence: true
  validates :participants, presence: true
end
