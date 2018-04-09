Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit,:update]
  resources :users, only: :show do
    resources :tweets , only: :index
    member do
      post :follow
      post :unfollow
    end  
  end
  root 'tweets#index'


  resources :tweets, only: [:show, :index, :create] do
    resources :replies, only: [:index,:create]
    member do
      post :like
      post :unlike
    end
  end

  
  

  namespace :admin do
    resources :tweets
    root 'tweets#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
