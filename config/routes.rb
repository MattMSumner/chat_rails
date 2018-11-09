Rails.application.routes.draw do
  root 'homes#show'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :chatrooms, only: [:index, :new, :create, :show]
  resources :messages, only: :create
end
