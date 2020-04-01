Rails.application.routes.draw do
  root 'home#index'

  devise_for :users 

  resources :users
  resources :home do
    collection do
      get 'find_provider_for_city'
      get 'find_provider_by_category'
    end
  end

  resources :categories
  
  resources :provider_details

end
