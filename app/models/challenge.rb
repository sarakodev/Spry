class Challenge < ApplicationRecord
  has_many :users, through: :participations

  validates :name, presence: true
  validates :type, presence: true
end
