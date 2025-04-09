Rails.application.routes.draw do


<<<<<<< HEAD
=======

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  devise_for :users


  root "pages#login"

  resources :users, only: [ :new, :create, :edit, :update, :show, :destroy ]
  resources :listings

  get "up" => "rails/health#show", as: :rails_health_check


  get "/login", to: "pages#login"
  post "/login", to: "pages#create"
  get "/market", to: "pages#market"

  get "/signup", to: "pages#signup"

  delete "/logout", to: "pages#destroy"
>>>>>>> deb73d1e9bb1e473a8acc7c9b3d9d38a0e7bde6b
end
