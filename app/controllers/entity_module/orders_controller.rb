class EntityModule::OrdersController < EntitiesController
  before_action :set_order, only: %i[edit]

  def index
    @q = current_entity.orders.ransack(params[:q])

    @orders = @q.result(distinct: true).order("created_at DESC")
  end

  def new
    @order = current_entity.orders.build
    @order.order_items.build
  end

  def create
    @order = current_entity.orders.build(order_params)

    if @order.save
      redirect_to entity_orders_path, flash: { success: "Pedido salvo com sucesso." }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  private

  def set_order
    @order = current_entity.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(order_items_attributes: [:product_id, :quantity])
  end
end
