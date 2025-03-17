module ProductsHelper

  def visible_tag(visible)
    tag_class, tag_text = visible ? ["text-bg-success", "yes"] : ["text-bg-secondary", "no"]

    tag.i class: "badge rounded-pill #{tag_class}" do
      Product.human_attribute_name "visible.#{tag_text}"
    end
  end
end