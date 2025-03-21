class StravaAuthController < ApplicationController
  def connect
    # Page avec le bouton de connexion Strava
  end

  def callback
    auth_data = request.env['omniauth.auth']
    
    current_user.update(
      strava_id: auth_data.uid,
      strava_access_token: auth_data.credentials.token,
      strava_refresh_token: auth_data.credentials.refresh_token,
      strava_token_expires_at: Time.at(auth_data.credentials.expires_at)
    )

    @challenge = Challenge.find(session[:challenge_id])
    
    current_user.sync_strava_activities(@challenge)

    redirect_to challenge_path(@challenge), notice: 'Compte Strava connecté avec succès!'
  end

  def failure
    redirect_to root_path, alert: "La connexion à Strava a échoué : #{params[:message]}"
  end
end