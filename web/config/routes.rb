Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  get '/sign_in', to: 'pages#sign_in'
  get '/sign_up', to: 'pages#sign_up'
end
