module SessionsHelper
  def g_icon(session)
    return if session.group.nil?

    html = image_tag(session.group.icon, class: 'group__thumbnail')
    html.html_safe
  end
end
