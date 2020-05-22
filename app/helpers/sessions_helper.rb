module SessionsHelper
  def g_icon(session)
    return if session.group.nil?

    html = image_tag(session.group.icon, class: 'group__thumbnail', onerror: "this.error=null;this.src='https://placeimg.com/50/50/tech'")
    html.html_safe
  end
end
