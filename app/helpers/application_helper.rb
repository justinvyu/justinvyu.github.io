module ApplicationHelper

    # Active feature
    def nav_link(link_text, link_path)
      class_name = current_page?(link_path) ? 'current' : ''

    #   content_tag(:a, :class => class_name) do
    link_to link_text, link_path, class: class_name
    #   end
    end

end
