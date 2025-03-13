class BookingsController < ApplicationController
    def index
        @events = event.all
    end
    def new
        @event = Event.find(params[:event_id])
        @booking = Booking.new
    end
    def create
        Rails.logger.debug ">>> CREATE ACTION CALLED <<<"
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        @event = Event.find(params[:event_id])
        @booking.event = @event
        @booking.status = "En attente"
    
        if @booking.save!
            Rails.logger.debug ">>> BOOKING SAVED <<<"
          redirect_to "/bookings", notice: "your participation oh this event is register"
        else
            Rails.logger.debug ">>> BOOKING SAVE FAILED: #{@booking.errors.full_messages} <<<"
            render :new, status: :unprocessable_entity
        end
    end
    private
    def booking_params
        params.require(:booking).permit(:status)
    end
end