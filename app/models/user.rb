class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy # As an organizer
  has_many :bookings, dependent: :destroy
  has_many :participations
  has_many :challenges, through: :participations
  has_many :events_as_participant, through: :bookings, source: :event

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true

  def fullname
    "#{first_name} #{last_name}"
  end
end
