Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  root to: 'pages#index'
  get '/users', to: 'pages#index'

  resources :companies, only: [:show]
  resources :sites, only: [:index]

  namespace :api do
    resources :site_credentials, only: %i[create update]
  end
end
