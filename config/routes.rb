Rails.application.routes.draw do

  root 'home#index'
 
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
      post 'reminder'
      get 'reminder_status/:id', action: :reminder_status, as: :reminder_status
      delete 'delete_reminder'
    end
  end 

  resources :categories
  
  resources :provider_details do
    get ':token/confirm_email',on: :collection, action: :confirm_email, as: :confirm_email

    resources :comments
  end

end
