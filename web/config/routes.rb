Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  root to: 'pages#index'
  get '/users', to: 'pages#index'
end
