Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: :show
  root to: 'catch_copies#index'
  post 'catch_copies/ranking' => 'catch_copies#ranking'
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
   
  resources :catch_copies do
    resources :comments, only: :create
    collection do
      get 'search'
    end

  end
end
