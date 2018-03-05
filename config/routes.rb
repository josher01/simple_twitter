Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets, only: [:index, :create] do
    resources :replies, only: [:index,:create]
  end

  namespace :admin do
    resources :tweets
    root 'tweets#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
