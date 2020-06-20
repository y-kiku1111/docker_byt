Rails.application.routes.draw do

  devise_for :users
  root to: 'catch__copies#index'
  
  resources :catch_copies
  resources :users, only: :show

end
