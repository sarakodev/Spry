class EventsController < ApplicationController
  def index
    @events = Event.all
    if params[:search][:address].present?
      @events = @events.near(params[:search][:address], 10)
    end
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
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
      redirect_to events_path, notice: "Your event has been successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    if @event.nil?
      redirect_to events_path, alert: "Event not found"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :pace, :datetime, :description, :participants, :address, :kilometers, :photo)
  end
end
