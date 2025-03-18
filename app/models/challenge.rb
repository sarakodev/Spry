class Challenge < ApplicationRecord
  CATEGORIES = ["Distance challenge", "Duration challenge"]

  has_many :participations
  has_many :users, through: :participations, dependent: :destroy
  accepts_nested_attributes_for :participations, allow_destroy: true
  belongs_to :user

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :team_name, presence: true

  geocoded_by :start_point, latitude: :start_latitude, longitude: :start_longitude
  geocoded_by :end_point, latitude: :end_latitude, longitude: :end_longitude
  after_validation if: -> { :will_save_change_to_start_point? || :will_save_change_to_end_point? } do
    geocode
  end

  private

  def geocode
    geocoded = Geocoder.search(self.start_point).first
    if geocoded
      self.start_latitude = geocoded.latitude
      self.start_longitude = geocoded.longitude
    end
    geocoded = Geocoder.search(self.end_point).first
    if geocoded
      self.end_latitude = geocoded.latitude
      self.end_longitude = geocoded.longitude
    end
  end
end
