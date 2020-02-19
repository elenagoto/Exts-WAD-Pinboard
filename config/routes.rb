Rails.application.routes.draw do
  # Home routes
  root to: 'home#index'
  get 'home/index'

  # Resources
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
