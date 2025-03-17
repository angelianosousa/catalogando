module StockHelper
  def products_for_select
    current_entity.products.map { |prod|  [prod.name, prod.id] }
  end

  def badge_move_type(move_type)
    if move_type == "vendas"
      badge_pill(move_type.upcase, class: "success")
    else
      badge_pill(move_type.upcase, class: "danger")
    end
  end

end
