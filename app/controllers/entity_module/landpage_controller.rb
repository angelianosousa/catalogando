class EntityModule::LandpageController < ApplicationController
  layout "landpage"

  def index
    @entity = Entity.friendly.find(params[:id])

    @q = @entity.categories.with_available_products.ransack(params[:q])
    @categories = @q.result(distinct: true)

    @landpage = @entity.landpage
  end
end
