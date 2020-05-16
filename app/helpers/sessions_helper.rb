module SessionsHelper

    def g_icon(s)
      unless s.group.nil?
        html = image_tag(s.group.icon, class: "group__thumbnail")

        return html.html_safe
      end
    end
  
end
