Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sites do
    resources :flows
    resources :steps
  end

  resources :flows, only: [:create, :new, :edit, :update] do
    resources :steps, only: [:index]
  end
end
