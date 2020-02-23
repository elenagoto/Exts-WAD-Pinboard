Rails.application.routes.draw do
  # Home routes
  root to: 'home#index'
  get 'home/index'

  # Resources
  resources :users do
    resources :images
  end

  resources :pins do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
