Rails.application.routes.draw do

  root 'home#index'
  get 'msg',to: "home#msg"

  devise_for :users 

  resources :users
  resources :home do
    collection do
      get 'find_provider_for_city'
      get 'find_provider_by_category'
    end
  end 

  resources :comments


  resources :categories
  
  resources :provider_details

end
