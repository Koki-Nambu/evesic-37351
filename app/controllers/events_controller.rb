class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @events = Event.all.order("created_at DESC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def event_params
    params.require(:event).permit(:image, :title, :date, :place, :charge, :content).merge(user_id: current_user.id)
  end
end
