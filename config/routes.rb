Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :photos do
    resource :like

    resources :comments
  end

  resources :users do
    resource :follow

    resources :followings
    resources :followers
    resources :likes
  end
end
