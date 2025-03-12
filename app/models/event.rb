class Event < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :datetime, presence: true
  validates :pace, presence: true
  validates :participants, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
