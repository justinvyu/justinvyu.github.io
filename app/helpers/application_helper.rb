module ApplicationHelper

    # Active feature
    def nav_link(link_text, link_path)
        class_name = current_page?(link_path) ? 'current' : ''

        #   content_tag(:a, :class => class_name) do
        link_to link_text, link_path, class: class_name
    end

    # Syntax Highlighting
    class HTMLwithPygments < Redcarpet::Render::HTML # Subclassing Redcarpet renderer
        def block_code(code, language)
            Pygments.highlight(code, lexer: language)
        end
    end

    def markdown(content)
        renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
        options = {
            autolink: true,
            no_intra_emphasis: true,
            disable_indented_code_blocks: true,
            fenced_code_blocks: true,
            lax_html_blocks: true,
            strikethrough: true,
            superscript: true
        }
        # Create the Markdown parser
        Redcarpet::Markdown.new(renderer, options).render(content).html_safe
    end

end
