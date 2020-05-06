class EventsController < ApplicationController
  before_action :user_authenticated
  include EventsHelper

  def index
    @events = Event.select('events.*, users.id, users.name creator_name').joins(:creator)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

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
    @attendees = User.find_by_sql(['SELECT u.id, u.name FROM users u JOIN attendee_events e ON e.user_id = u.id WHERE e.event_id = ?', params[:id]])
  end

  private

  def user_authenticated
    redirect_to root_path unless session[:name]
  end

  def current_user
    User.find(session[:id])
  end
end
