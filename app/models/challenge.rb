class Challenge < ApplicationRecord
  CATEGORIES = ["Distance challenge", "Duration challenge"]
  has_many :participations
  has_many :users, through: :participations, dependent: :destroy

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :team_name, presence: true

end
