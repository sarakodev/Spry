class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy # As an organizer
  has_many :bookings, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :challenges, through: :participations
  has_many :owned_challenges, class_name: "Challenge", dependent: :destroy
  has_many :events_as_participant, through: :bookings, source: :event

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true

  def fullname
    "#{first_name} #{last_name}"
  end

  def sync_strava_activities(challenge)
    StravaSyncService.new(self, challenge).sync_activities
  end
end
