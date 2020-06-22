Rails.application.routes.draw do

  devise_for :users
  root to: 'catch__copies#index'  
  resources :users, only: :show

  resources :catch_copies do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  
end
