module EntitiesHelper
  def status_badge(entity)
    tag_class, tag_text = entity.active ? ["text-bg-success", "Ativo"] : ["text-bg-secondary", "Inativo"]

    tag.i class: "badge #{tag_class}" do
      tag_text
    end
  end
end
