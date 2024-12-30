class EntitiesController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  layout "entities"
<<<<<<< Updated upstream
=======

  before_action :authenticate_admin_entity!

  helper_method :current_entity

  def current_entity
    current_admin_entity.try(:entity)
  end

  private

  def default_url_options(options = {})
    if admin_entity_signed_in?
      { entity: current_entity.slug }
    else
      {}
    end
  end
>>>>>>> Stashed changes
end
