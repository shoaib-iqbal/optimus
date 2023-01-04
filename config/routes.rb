Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "bills#index"

  # resources :users, only: [:create]
  get '/create_user', to: 'users#create', as: 'create_user'
  resources :bills do
    member do
      post 'upvote'
      post 'downvote'
    end
  end
end
