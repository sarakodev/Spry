class Challenge < ApplicationRecord
  CATEGORIES = ["Distance challenge", "Duration challenge"]

  has_many :participations
  has_many :users, through: :participations, dependent: :destroy
  accepts_nested_attributes_for :participations, allow_destroy: true
  belongs_to :user

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :team_name, presence: true


end
