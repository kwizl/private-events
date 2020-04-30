class EventsController < ApplicationController
  include EventHelper
  before_action :user_authenticated
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def user_authenticated

  end
end
