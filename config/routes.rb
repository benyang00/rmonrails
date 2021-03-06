Rails.application.routes.draw do
  #root routes
  root 'static_pages#home'

  #static routes
  get 'faq', to: 'static_pages#faq'
  get 'contact', to: 'static_pages#contact'
  get 'about', to: 'static_pages#about'


  #dynamic routes
  get 'users/signup', to: 'users#new'
  get 'staffs/signup', to: 'staffs#new'
  get 'staffs/login', to: 'sessions#new'
  post 'staffs/login', to: 'sessions#create'
  delete 'staffs/logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessiions#destroy', as: 'sign_out'


  #restful routes
  resources :products
  resources :reviews
  resources :users
  resources :staffs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
