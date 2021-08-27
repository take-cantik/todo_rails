Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

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

  resources :columns
  resources :cards
end
