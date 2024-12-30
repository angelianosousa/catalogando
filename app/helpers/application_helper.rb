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
      link_to link, class: "btn btn-primary btn-round" do
        "#{fa_icon('plus-circle')} #{text}".html_safe
      end
    end
  end

  def link_to_edit_resource(text, link)
    content_tag :p, class: "text-right" do
      link_to link, class: "btn btn-black btn-sm btn-round", style: "font-size: 15px;" do
        "#{fa_icon('edit')}".html_safe
      end
    end
  end

  def link_to_delete_resource(text, link)
    content_tag :p, class: "text-right" do
      link_to link, class: "btn btn-danger btn-sm btn-round", style: "font-size: 15px;", data: { 'turbo-method': :delete, 'turbo-confirm': 'Tem certeza ?' } do
        "#{fa_icon('trash-o')}".html_safe
      end
    end
  end
end
