class EventsController < ApplicationController
  def index
    @events = Event.all
    if params[:search].present?
      @events = @events.near(params[:search][:address], 10)
    end
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { event: event }),
        marker_html: render_to_string(partial: "shared/marker_spry_purple")
      }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      redirect_to @event, notice: "Your event has been successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @booking = Booking.new
    @bookings = @event.bookings.where(user: current_user)

    if @event.nil?
      redirect_to events_path, alert: "Event not found"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :pace, :datetime, :description, :participants, :kilometers, :photo, :location)
  end
end
