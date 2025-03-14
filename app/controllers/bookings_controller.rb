class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :reject]
  def create
    @booking = Booking.new(status: "Pending")
    @booking.user = current_user
    @event = Event.find(params[:event_id])
    @booking.event = @event

    if @booking.save
      # TO DO : Changer le path events_path pour que ça renvoit vers le dashboard (une fois créé)
      redirect_to user_path(current_user), notice: "Your request was sent to the organizer and is pending"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    if @booking.nil?
      redirect_to events_path, alert: "Event not found"
    end
  end

  def accept
    if @booking.accept!
      redirect_to @booking.event, notice: 'Registration accepted.'
    else
      redirect_to @booking.event, alert: 'Error: registration could not be accepted'
    end
  end

  def reject
    if @booking.reject!
      redirect_to @booking.event, notice: 'Registration declined.'
    else
      redirect_to @booking.event, alert: 'Error: registration could not be declined'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
