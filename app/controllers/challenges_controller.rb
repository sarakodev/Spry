class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to @challenge, notice: "Your new challenge just started!"
    else
      render 'challenges/index', status: :unprocessable_entity
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    # @participation = Participation.new
    @markers = [
      { lat: @challenge.start_latitude, lng: @challenge.start_longitude },
      { lat: @challenge.end_latitude, lng: @challenge.end_longitude }
    ]
  end

  def challenges
    @challenges = current_user.challenges
    @markers = []
    @challenges.each do |challenge|
      @markers << { lat: challenge.start_latitude, lng: challenge.start_longitude }
      @markers << { lat: challenge.end_latitude, lng: challenge.end_longitude }
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:category, :start_point, :end_point, :title, :team_name)
  end
end
