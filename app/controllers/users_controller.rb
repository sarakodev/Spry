class UsersController < ApplicationController
  def show
    @user = current_user

    @events_as_participant = current_user.events_as_participant
    @events_as_organizer = current_user.events
  end
end
