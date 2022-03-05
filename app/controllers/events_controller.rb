class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_hot_event, only: [:index]

  def index
    @events = Event.all.order("created_at DESC")
    @hot_event = @hot.limit(1).offset(0)
    @hot_event2 = @hot.limit(1).offset(1)
    @hot_event3 = @hot.limit(1).offset(2)
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

  def show
    impressionist(@event, nil, unique: [:ip_address])
    @comment = Comment.new
    @comments = @event.comments.includes(:user)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  def search
    @events = Event.search(params[:keyword]).order("created_at DESC")
  end


  private

  def event_params
    params.require(:event).permit(:image, :title, :date, :place, :charge, :content).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_hot_event
    @hot = Event.order(impressions_count: 'DESC')
  end

end
