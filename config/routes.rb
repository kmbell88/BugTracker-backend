Rails.application.routes.draw do
  resources :notes
  resources :bugs
  resources :apps
  resources :users, only: [:create, :index]
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
end