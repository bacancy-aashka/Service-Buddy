Rails.application.routes.draw do

  root 'home#index'
  get 'msg',to: "home#msg"

  devise_for :users 

  resources :users do
    get 'inbox', on: :collection, to: "conversations#inbox"  
    get 'msg',to: "home#msg" 
  end
  
  resources :home do
    collection do
      get 'find_provider_for_city'
      get 'find_provider_by_category'
      get 'filter_for_cities'
    end
  end 

  resources :categories
  
  resources :provider_details do
    resources :comments
  end

end
