Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # ============================ AUTHENTICATION =========================== #

  devise_for :admin_entities

  # ============================ AUTHENTICATION =========================== #

  # ============================ CLIENTS AREA ============================= #

  scope ":entity", as: :entity, module: "entity_module" do
    resources :dashboard, only: :index
    resources :categories, except: :show
    resources :products, except: :show do
      post :toggle_visible
    end
  end

  # ============================ CLIENTS AREA ============================= #

  # ========================= CONFIG NEW ENTITIES ========================= #

  namespace "admin" do
    resources :entities, except: :show
  end

  # ========================= CONFIG NEW ENTITIES ========================= #

  root "entity_module/dashboard#index"
end
