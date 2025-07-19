module ApplicationHelper
  def link_to_back
    content_tag :p, class: "text-right" do
      link_to :back, class: "btn btn-black btn-round" do
        "#{fa_icon("arrow-circle-left")} Voltar".html_safe
      end
    end
  end

  def link_to_new_resource(text, link)
    content_tag :p, class: "text-right" do
      link_to link, class: "btn btn-primary" do
        "#{fa_icon('plus-circle')} #{text}".html_safe
      end
    end
  end

  def link_to_edit_resource(text, link)
    content_tag :p, class: "text-right" do
      link_to link, class: "btn btn-black btn-sm", style: "font-size: 15px;" do
        "#{fa_icon('edit')}".html_safe
      end
    end
  end

  def link_to_delete_resource(text, link)
    content_tag :p, class: "text-right" do
      link_to link, class: "btn btn-danger btn-sm", style: "font-size: 15px;", data: { 'turbo-method': :delete, 'turbo-confirm': 'Tem certeza ?' } do
        "#{fa_icon('trash-o')}".html_safe
      end
    end
  end

  def badge_pill(content = nil, html_options = {})
    tag.span(class: "badge #{html_options[:class]}", style: "font-size: 11px; #{html_options[:style]}") do
      content
    end
  end
end
