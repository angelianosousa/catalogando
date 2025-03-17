module OrderHelper
  def products_for_select
    current_entity.products.map { |prod|  [prod.name, prod.id] }
  end
end
