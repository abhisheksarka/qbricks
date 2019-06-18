Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  root to: 'pages#index'
  get '/users', to: 'pages#index'

  resources :companies, only: [:show]
  resources :sites, only: [:index]
  resources :site_credentials, only: [:create]

  namespace :api do
    resources :site_credentials, only: [:create]
  end
end
