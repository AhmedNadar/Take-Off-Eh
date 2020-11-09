class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @events = Event.all
    @upcoming_events = Event.upcoming
    @past_events =  Event.past
    respond_with(@events)
  end

  def show
    @creator = User.find(@event.user_id)
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  def my_events
    @my_events = current_user.events
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :date, :location, :category, :details)
    end
end
