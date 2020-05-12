module EventsHelper
  def assist(event_id)
    html = ''
    html += if !current_user.attended_events.exists?(event_id)
              button_to 'Attend', assist_event_path(event_id: event_id), { class: 'btn btn-primary' }
            else
              button_to 'Attend', assist_event_path(event_id: event_id), { class: 'btn btn-secondary', disabled: true }
            end

    html.html_safe
  end
end
