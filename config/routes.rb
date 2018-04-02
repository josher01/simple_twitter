Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit,:update]
  resources :users, only: :show do
    resources :tweets , only: :index
  end
  root 'tweets#index'
  concern :likeable do
    resources :likes, only: [:create, :destroy]
  end

  resources :tweets
  resources :tweets, only: [:show] do
    resources :replies, only: [:index,:create]
    member do
        post :like
        delete :unlike
    end
  end

  
  

  namespace :admin do
    resources :tweets
    root 'tweets#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
