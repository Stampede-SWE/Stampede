Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#login"

  resources :users, only: [ :new, :create, :edit, :update, :show, :destroy ]

  get "/login", to: "pages#login"
  post "/login", to: "pages#create"
  get "/market", to: "pages#market"

  get "/signup", to: "pages#signup"

  delete "/logout", to: "pages#destroy"

  # routes for posting items
  get "/sell-my-stuff", to: "pages#listing_form"
  post "/sell-my-stuff", to: "pages#create_listing"

  get "/successful-post", to:"pages#successful_post"


end
