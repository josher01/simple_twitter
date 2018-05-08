Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit,:update]
  resources :users, only: :show do
    member do
      post :follow
      post :unfollow
      get :followers
      get :followings
      get :tweets
      get :likes
    end  
  end
  root 'tweets#index'


  resources :tweets, only: [:index, :create] do
    resources :replies, only: [:index,:create]
    member do
      post :like
      post :unlike
    end
  end

  
  

  namespace :admin do
    resources :tweets
    resources :users, only: [:index] 
    root 'tweets#index'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
