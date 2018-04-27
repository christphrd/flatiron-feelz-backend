Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #routes for API backend
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show]
      post "/login", to: "auth#create"
      post "/signup", to: "users#create"
      get "/current_user", to: "auth#show"
      resources :posts, only: [:create]
    end
  end
end
