class EventsController < ApplicationController
  include EventsHelper
  helper_method :current_user, :assist_event
  before_action :user_authenticated

  def index
    @events = Event.select('events.*, users.id user_id, users.name creator_name').joins(:creator)
    @past_events = @events.past_events
    @upcoming_events = @events.upcoming_events
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
    current_user
  end

  def assist_event
    current_user
    AttendeeEvent.create(user_id: @current_user.id, event_id: params[:event_id])
    redirect_to event_url(id: params[:event_id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :user_id)
  end

  def user_authenticated
    redirect_to login_path unless session[:name]
  end
end
