Rails.application.routes.draw do
  namespace :admins do
    resources :genres, only: [:index, :create]
    resources :items, only: [:index, :create, :edit, :update, :desroy]
    resources :roasts, only: [:index, :create, :destroy]
  end
  namespace :users do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create,:edit, :update, :destroy]
  end
  devise_for :admins
  devise_for :users
  namespace :users do
    get 'homes/top'
  end
  root 'users/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
