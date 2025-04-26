Rails.application.routes.draw do
  root "pages#login"

  get "/login", to: "pages#login"
  post "/login", to: "pages#create"
  # get "/market", to: "pages#market"
  get "/signup", to: "pages#signup"
  post "/signup", to: "users#create"
  delete "/logout", to: "pages#destroy"
  get "/temp", to: "pages#temp"
  get "profile", to: "pages#profile"

  resources :users, only: [ :new, :create, :edit, :update, :show, :destroy ]
  resources :listings

  get "up" => "rails/health#show", as: :rails_health_check
end
