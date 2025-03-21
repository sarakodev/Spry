class Challenge < ApplicationRecord
  CATEGORIES = ["Distance challenge", "Duration challenge"]
  DURATIONS = ["The Office (US) - S1 | 2h30", "Fleabag - S1 | 2h36", "Desperate Housewives - S1 | 16h29", "Suits - S1 | 8h24"]


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

  after_create :set_distance, if: :saved_change_to_start_latitude?

  def update_completion
    if self.category == "Distance challenge"
      # Handle distance-based challenges
      total_distance = self.participations.map(&:distance).compact.sum
      completion = (total_distance.fdiv(self.distance))
    else
      # Handle duration-based challenges
      total_duration = self.participations.map(&:duration).compact.sum
      completion = (total_duration.fdiv(self.duration))
    end
    self.update(completion: completion)
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

  def set_distance
    self.update(distance: Geocoder::Calculations.distance_between([self.start_latitude, self.start_longitude], [self.end_latitude, self.end_longitude]))
  end





end
