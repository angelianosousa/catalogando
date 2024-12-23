module ApplicationHelper
  def link_to_back
    content_tag :p, class: "text-right" do
      link_to :back, class: "btn btn-black" do
        "#{fa_icon("arrow-circle-left")} Voltar".html_safe
      end
    end
  end

  def link_to_new_resource(text, link)
    content_tag :p, class: "text-right" do
      link_to link, class: "btn btn-primary", data: { turbolinks: false } do
        "#{fa_icon('plus-circle')} #{text}".html_safe
      end
    end
  end

  def link_to_edit_resource(text, link)
    content_tag :p, class: "text-right" do
      link_to link, class: "btn btn-black btn-sm", data: { turbolinks: false } do
        "#{fa_icon('edit')} Editar".html_safe
      end
    end
  end

  def link_to_delete_resource(text, link)
    content_tag :p, class: "text-right" do
      link_to link, class: "btn btn-danger btn-sm", data: { 'turbo-method': :delete, 'turbo-confirm': 'Tem certeza ?' } do
        "#{fa_icon('trash-o')} Remover".html_safe
      end
    end
  end
end
