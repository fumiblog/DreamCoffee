Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  namespace :users do
    get 'homes/top'
  end
  root 'users/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
