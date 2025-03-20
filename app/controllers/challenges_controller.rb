class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user

    @challenge.duration = parse_duration if params[:challenge][:duration] && @challenge.distance == 0

    if @challenge.save
      Participation.create(user_id: current_user.id, challenge_id: @challenge.id)
      redirect_to challenge_path(@challenge), notice: "Your new challenge just started!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @participation = @challenge.participations.find_by(user: current_user, challenge: @challenge)
    @markers = [
      {
        lat: @challenge.start_latitude,
        lng: @challenge.start_longitude,
        marker_html: render_to_string(partial: "marker_start")
      },
      {
        lat: @challenge.end_latitude,
        lng: @challenge.end_longitude,
        marker_html: render_to_string(partial: "marker_end")
      }
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

  def parse_duration
    string = params[:challenge][:duration].split(' | ')[1]
    if string.match?(/(\d+)h(\d+)/)
      match_data = string.match(/(\d+)h(\d+)/)
      hours = match_data[1].to_i
      minutes = match_data[2].to_i
      total_minutes = hours * 60 + minutes
      return total_minutes
    end
  end

  def challenge_params
    params.require(:challenge).permit(:category, :start_point, :end_point, :duration, :title, :team_name, user_ids: [])
  end
end
