module EventsHelper
  def event_params
    params.require(:event).permit(:name, :description, :date, :user_id)
  end

  def assist_event
    current_user
    AttendeeEvent.create(user_id: @current_user.id, event_id: params[:event_id])
    redirect_to event_url( :id => '1' )
  end
end
