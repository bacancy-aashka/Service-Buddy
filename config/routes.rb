Rails.application.routes.draw do
  root 'home#index'

  devise_for :users 

  resources :users
  get 'msg',to: "home#msg"

  resources :categories
  
  resources :provider_details

end
