class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  after_update :update_challenge_completion

  def update_challenge_completion
    total_distance = challenge.participations.map(&:distance).sum
    completion = (total_distance.fdiv(challenge.distance))
    challenge.update(completion: completion)
  end
end
