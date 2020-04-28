Rails.application.routes.draw do

  
  root 'home#index'
 
  devise_for :users 

  resources :admin, only: %i[index] do
    get 'pending_provider_details', on: :collection, action: :pending_provider_details, as: :pending_provider_details
    get 'show_provider_detail/:id', on: :collection, action: :show_provider_detail, as: :show_provider_detail
    delete 'delete_provider_detail/:id', on: :collection, action: :delete_provider_detail, as: :delete_provider_detail
  end
  
  resources :users do
    get 'inbox', on: :collection, to: "conversations#inbox"  
    get 'msg',to: "home#msg"

    collection do
      post 'faviourite_post'
      get 'faviourite_post_list'
    end

    get 'graph',to: "users#graph"

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

    resources :comments do
      get 'likes/create'
      get 'likes/delete'
    end
  end

end
