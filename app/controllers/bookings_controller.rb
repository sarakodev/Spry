class BookingsController < ApplicationController
    def index
        @booking = Booking.all
    end
    def show
        @booking = Booking.find(params[:id])
        if @booking.nil?
          redirect_to vans_path, alert: "reservation non trouvé non trouvé."
        end
    end
    def create
        @booking = Booking.new(status: "En attente")
        @booking.user = current_user
        @event = Event.find(params[:event_id])
        @booking.event = @event

        if @booking.save
          redirect_to events_path, notice: "your participation oh this event is register"
        else

            render :new, status: :unprocessable_entity
        end
    end
end