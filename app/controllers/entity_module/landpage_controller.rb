class EntityModule::LandpageController < ApplicationController
  layout "landpage"

  def index
    @entity = Entity.friendly.find(params[:id])

    @q = @entity.categories.with_available_products.ransack(params[:q])
    @categories = @q.result(distinct: true).joins(:products).order(name: :asc)

    respond_to do |format|
      format.html # Para renderizar a página normalmente
      format.turbo_stream # Para renderizar atualizações via Turbo Stream
    end
  end
end
