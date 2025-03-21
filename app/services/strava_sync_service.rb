# app/services/strava_sync_service.rb
require 'strava-ruby-client'

class StravaSyncService
  def initialize(user, challenge)
    @user = user
    @challenge = challenge
  end

  def sync_activities
    return unless @user.strava_access_token

    client = Strava::OAuth::Client.new(
      client_id: ENV['STRAVA_CLIENT_ID'],
      client_secret: ENV['STRAVA_CLIENT_SECRET']
    )

    refresh_token if token_expired?

    api_client = Strava::Api::Client.new(
      access_token: @user.strava_access_token
    )

    # Récupérer les activités récentes
    activities = api_client.athlete_activities

    participation = @user.participations.find_by(challenge: @challenge)

    activities.each do |activity|
      # Mettre à jour les participations correspondantes
      if activity_matches_challenge?(activity, @challenge)
        if @challenge.category == "Distance challenge"
          new_distance = participation.distance.to_f + (activity.distance.to_f / 1000) # Conversion en km
          participation.update(distance: new_distance)
        elsif @challenge.category == "Duration challenge"
          new_duration = participation.duration + activity.moving_time * 60 # Temps en secondes
          participation.update(duration: new_duration)
        end
      end
    end
  end

  private

  def token_expired?
    Time.now > @user.strava_token_expires_at
  end

  def refresh_token
    client = Strava::OAuth::Client.new(
      client_id: ENV['STRAVA_CLIENT_ID'],
      client_secret: ENV['STRAVA_CLIENT_SECRET']
    )
    
    response = client.oauth_token(
      refresh_token: @user.strava_refresh_token,
      grant_type: 'refresh_token'
    )
    
    @user.update(
      strava_access_token: response.access_token,
      strava_refresh_token: response.refresh_token,
      strava_token_expires_at: Time.at(response.expires_at)
    )
  end

  def activity_matches_challenge?(activity, challenge)
    activity.sport_type == "Run" && activity.start_date > challenge.created_at
  end
end