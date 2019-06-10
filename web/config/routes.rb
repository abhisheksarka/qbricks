Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#index'
  get '/users', to: 'pages#index'
end
