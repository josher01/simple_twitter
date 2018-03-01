Rails.application.routes.draw do
  resources :tweets, only: [:index, :create] do
    resources :replies, only: [:index,:create]
  end

  namespace :admin do
    resources :tweets
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
