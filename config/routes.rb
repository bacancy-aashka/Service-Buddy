Rails.application.routes.draw do

  root 'home#index'
  get 'msg',to: "home#msg"

  devise_for :users 

  resources :users 

  resources :comments

  resources :categories
  
  resources :provider_details

end
