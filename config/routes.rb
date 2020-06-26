Rails.application.routes.draw do

  devise_for :users
  resources :users, only: :show
  root to: 'catch_copies#index'
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
 
  # post '/catch_copies/guest_sign_in', to: 'catch_copies#new_guest'  
  
  resources :catch_copies do
    resources :comments, only: :create
    collection do
      get 'search'
    end

  end

end
