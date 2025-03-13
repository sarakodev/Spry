class BookingsController < ApplicationController
  def index
    @booking = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    if @booking.nil?
      redirect_to events_path, alert: "Event not found"
    end
  end

  def create
    @booking = Booking.new(status: "Pending")
    @booking.user = current_user
    @event = Event.find(params[:event_id])
    @booking.event = @event

    if @booking.save
      # TO DO : Changer le path events_path pour que ça renvoit vers le dashboard (une fois créé)
      redirect_to events_path, notice: "Your request was sent to the organizer and is pending"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
