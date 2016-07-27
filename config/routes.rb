Rails.application.routes.draw do
  #root routes
  root 'users#index'

  #static routes

  #dynamic routes
  get '/signup', to: 'staffs#new'

  #restful routes
  resources :products
  resources :reviews
  resources :users
  resources :staffs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
