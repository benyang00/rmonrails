Rails.application.routes.draw do
  #root routes
  root 'sessions#new'

  #static routes
  get 'faq', to: 'static_pages#faq'
  get 'contact', to: 'static_pages#contact'
  get 'about', to: 'static_pages#about'


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
