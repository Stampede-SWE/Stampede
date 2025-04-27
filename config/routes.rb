Rails.application.routes.draw do
  root "pages#login"

  get "/login", to: "pages#login"
  post "/login", to: "pages#create"
  # get "/market", to: "pages#market"
  get "/signup", to: "pages#signup"
  post "/signup", to: "users#create"
  delete "/logout", to: "pages#destroy"
  get "/temp", to: "pages#temp"
  get "/profile", to: "pages#profile"
  get "/edit-profile", to: "pages#editprofile"
  post "/edit-profile", to: "users#update"
  get "/reset-password", to: "pages#resetpassword"
  post "/reset-password", to: "users#resetpassword"
  resources :users
  resources :listings
  
  resources :messages, only: [ :new, :create ]
  get "messages/unified", to: "messages#unified", as: "unified_messages"



  get "up" => "rails/health#show", as: :rails_health_check
end
