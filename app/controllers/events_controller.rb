class EventsController < ApplicationController
  before_action :user_authenticated
  include EventsHelper

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @event = User.find(session[:id])
  end

  private

  def user_authenticated
    redirect_to root_path unless session[:name]
  end
end
