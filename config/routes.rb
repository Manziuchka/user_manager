Rails.application.routes.draw do
  devise_for :users
  root 'users#index', as: 'home'
  resources :users, only: [:show, :index]

  namespace :admin do
    resources :users, except: [:index]
  end
end
