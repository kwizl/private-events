module UserHelper
  def users_list(users)
    html = ''
    users.each do |u|
      html += <<-HTML
          <tr scope="row">
          <td>#{u.name}</td>
          </tr>
      HTML
    end
    html.html_safe
  end
end
