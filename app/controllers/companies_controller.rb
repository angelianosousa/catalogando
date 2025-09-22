class CompaniesController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  before_action :authenticate_company_admin!

  helper_method :current_company

  def current_company
    current_company_admin.try(:company)
  end

  # private

  def default_url_options(options = {})
    if company_admin_signed_in?
      { entidade: current_company.slug }
    else
      {}
    end
  end
end
