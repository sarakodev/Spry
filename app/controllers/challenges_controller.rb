class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
    @participation = Participation.new
  end

  def challenges
    @challenges = current_user.challenges
  end

  private

  def challenge_params
    params.require(:challenge).permit(:name, :team, :location_start, :location_end)
  end
end
