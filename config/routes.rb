Rails.application.routes.draw do
  root 'users#index'

  resources :products
  resources :reviews
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
