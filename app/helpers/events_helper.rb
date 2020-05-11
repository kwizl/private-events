module EventsHelper

  def assist_event
    current_user
    AttendeeEvent.create(user_id: @current_user.id, event_id: params[:event_id])
    redirect_to event_url(id: params[:event_id])
  end
end
