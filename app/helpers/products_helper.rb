module ProductsHelper

  def visible_tag(visible)
    tag_class, tag_text = visible ? ["text-bg-success", "Sim"] : ["text-bg-secondary", "Não"]

    tag.i class: "badge rounded-pill #{tag_class}" do
      tag_text
    end
  end
end