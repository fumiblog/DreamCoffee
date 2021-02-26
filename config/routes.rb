Rails.application.routes.draw do
  namespace :admins do
    resources :genres, only: [:index, :create]
    resources :items, only: [:index, :create, :edit, :update, :destroy]
    resources :roasts, only: [:index, :create, :destroy]
    resources :tastes, only: [:index, :create, :destroy]
  end
  namespace :users do
    resources :items, only: [:index, :show]
    resources :users, only: [:show, :edit, :update]
    resources :cart_items, only: [:index, :create,:edit, :update, :destroy]do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only: [:index, :new, :show, :create] do
      collection do
        post :confirm
        get :complete
      end
    end
  end
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users' => 'users/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'users/passwords#new', as: 'new_user_password'
  end
  namespace :users do
    get 'homes/top'
  end
  root 'users/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
