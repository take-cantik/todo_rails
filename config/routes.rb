Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  root 'home#index'

  get '/columns', to: 'column#index'
  get '/columns/new', to: 'column#new'
  post '/columns', to: 'column#create'
  delete '/columns/:id', to: 'column#destroy'
  get '/columns/:id/edit', to: 'column#edit'
  patch '/columns/:id', to: 'column#update'
  patch '/columns/:count/swap', to: 'column#swap', as: :swap_column

  get '/cards', to: 'card#index'
  get '/cards/new', to: 'card#new'
  post '/cards', to: 'card#create'
  delete '/cards/:id', to: 'card#destroy'
  get '/cards/:id/edit', to: 'card#edit'
  patch '/cards/:id', to: 'card#update'
  get '/cards/:id', to: 'card#show'
  patch '/cards/:id/move', to: 'card#move', as: :move_card

  post '/comments/:id', to: 'comment#create', as: :comment

  get '/users', to: 'user#index'
  get '/users/:id', to: 'user#show'

  namespace :api, {format: 'json'} do
    resources :columns
    resources :cards
    resources :users, :only => [:index, :show]
  end
end
