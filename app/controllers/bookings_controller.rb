class BookingsController < ApplicationController
 
    # def new
    #     @event = Event.find(params[:event_id])
    #     @booking = Booking.new
    # end
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
