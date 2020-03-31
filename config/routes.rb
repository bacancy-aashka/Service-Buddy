Rails.application.routes.draw do
  root 'home#index'

  devise_for :users 

  resources :users do
    get 'msg',to: "home#msg"
  end
  resources :categories
  
  resources :provider_details

end
