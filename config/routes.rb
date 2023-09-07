Rails.application.routes.draw do
  root 'pages#home'
  #/dashboard
  resources :users do
    resources :properties do
      resources :rooms
    end 
  end 

  # get '/property_guests', to: 'property_guests#index'
  resources :guests do 
    resources :reservations do 
      resources :occupied_rooms
    end 
  end 


  # resources :users, only: [:create, :show]
  # resources :properties, only: [:create]
  # resources :rooms, only: [:create]

  # get "/dashboard", to: "rooms#index"
  # get "/users/:user_id/properties/:property_id/add_rooms", to: "rooms#new"
  # post "/users/:user_id/properties/:property_id/rooms", to: "rooms#create"

  # get "/users/:user_id/properties/add_property", to: "properties#new"
  # get "/users/:user_id/properties", to: "properties#index"
  # get "/users/:user_id/properties/:property_id", to: "properties#show"

  get "/signup", to: "users#new"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
end
