class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  after_save :update_challenge_completion

  def update_challenge_completion
    if challenge.distance.present?
      # Handle distance-based challenges
      total_distance = challenge.participations.map(&:distance).compact.sum
      completion = (total_distance.fdiv(challenge.distance))
    elsif challenge.duration.present?
      # Handle duration-based challenges
      total_duration = challenge.participations.map(&:duration).compact.sum
      completion = (total_duration.fdiv(challenge.duration))
    else
      # Handle cases where neither distance nor duration is set
      completion = 0.0
    end

    challenge.update(completion: completion)
  end
end
