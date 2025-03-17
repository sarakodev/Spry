class Challenge < ApplicationRecord
  CATEGORIES = ["Distance challenge", "Duration challenge"]

  has_many :users, through: :participations

  validates :name, presence: true
  validates :type, presence: true, inclusion: { in: CATEGORIES }
  validates :team, presence: true

end
