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

  def events_list(events)
    html = ''
    events.each do |e|
      html += <<-HTML
      <tr scope="row">
        <td>#{e.name}</td>
        <td>#{e.description}</td>
        <td>#{e.date}</td>
        <td>#{e.creator.name}</td>
        <td>#{link_to 'view', e}</td>
      </tr>
      HTML
    end
    html.html_safe
  end

  def attendees_list(attendees)
    html = ''

    attendees.each do |a|
      html += <<-HTML
      <div class="row">
      <p>#{a.name}</p>
      </div>
      HTML
    end
    html.html_safe
  end
end
