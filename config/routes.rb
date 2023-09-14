Rails.application.routes.draw do
  root 'pages#home'

  resources :users do
    # sessions can manage user
    resources :properties do
      #property show can be a dashboard --
      resources :dashboards, only: [:index]
      resources :rooms
      resources :guests do 
        resources :reservations do 
          resources :occupied_rooms
        end 
      end 
    end 
  end 

  get "/signup", to: "users#new"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  # callbacks --> before action
end
