Rails.application.routes.draw do
  get 'static_pages/home'

  devise_for :users
  get "properties/search", to: "properties#search", as: :search_properties
  get "properties/reports", to: "properties#reports", as: :property_reports
  put "properties/:id/purchase", to: "properties#purchase", as: :purchase_property
  resources :properties

  root to: "properties#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :properties, only: :index
      resources :sessions, only: [:create, :destroy]
    end
  end

end
