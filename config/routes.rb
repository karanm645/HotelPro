Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:create, :show]
  resources :properties, only: [:create, :index]
  resources :rooms, only: [:create, :index]

  get "/dashboard", to: "rooms#index"
  get "/add_rooms", to: "rooms#new"

  get "/users/:user_id/add_property", to: "properties#new"

  get "/signup", to: "users#new"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
end
