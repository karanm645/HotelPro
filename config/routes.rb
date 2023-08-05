Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:create, :show]
  resources :properties, only: [:create, :index]

  get "/users/:user_id/add_property", to: "properties#new"
  # get "/users/:user_id/all_properties", to: "properties#all"
  get "/signup", to: "users#new"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
end
