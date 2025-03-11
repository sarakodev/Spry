class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    def new
        @event = Event.new
    end
    def create
        @event = Event.new(event_params)
        @event.user = current_user
        if @event.save!
          redirect_to events_path, notice: "Votre event a bien été créé"
        else
          render :new, status: :unprocessable_entity
        end
      end
    private

  def event_params
    params.require(:event).permit(:name, :pace, :datetime, :description, :participants, :location)
  end
end
