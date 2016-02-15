Rails.application.routes.draw do
  get 'static_pages/home'

  devise_for :users
  get "properties/search", to: "properties#search", as: :search_properties
  resources :properties

  root to: "properties#index"
end
