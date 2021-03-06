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
      # resources :selfies, only: [:create]
      #index needed temporarily and everything else needed
      resources :photos
    end
  end

  #chatroom resources
  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]
  #actioncable from redis gem
  mount ActionCable.server => '/cable'
end
