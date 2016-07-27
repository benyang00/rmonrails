Rails.application.routes.draw do
  get 'sessions/new'

  #root routes
  root 'users#index'

  #static routes

  #dynamic routes
  get 'staffs/signup', to: 'staffs#new'

  #restful routes
  resources :products
  resources :reviews
  resources :users
  resources :staffs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
