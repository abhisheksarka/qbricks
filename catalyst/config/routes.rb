Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sites do
    resources :flows
    resources :steps
    member do
      get 'runner'
      patch 'run'
    end
  end

  resources :flows, only: [:create, :new, :edit, :update] do
    member do
      post :clone
    end
    resources :steps, only: [:index]
  end

  resources :flows_steps, only: [:update, :destroy]
end
