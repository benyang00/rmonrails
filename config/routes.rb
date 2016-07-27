Rails.application.routes.draw do
  get 'sessions/new'

  #root routes
  root 'sessions#new'

  #static routes

  #dynamic routes
  get 'staffs/signup', to: 'staffs#new'
  get 'staffs/login', to: 'sessions#new'
  post 'staffs/login', to: 'sessions#create'
  delete 'staffs/logout', to: 'sessions#destroy'


  #restful routes
  resources :products
  resources :reviews
  resources :users
  resources :staffs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
