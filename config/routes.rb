Rails.application.routes.draw do
  root 'homes#show'
  get '/auth/:provider/callback', to: 'sessions#create'
end
