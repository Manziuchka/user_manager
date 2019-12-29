# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'users#index', as: 'home'
  resources :users, only: %i[show index]

  namespace :admin do
    resources :users, except: [:index]
  end
end
