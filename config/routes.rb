Rails.application.routes.draw do
  root "listings#index"

  resources :listings

  get "up" => "rails/health#show", as: :rails_health_check
end
