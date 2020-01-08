Rails.application.routes.draw do
  devise_for :users
  root 'users#index', as: 'home'
  resources :users, only: %i[show index]

  namespace 'api' do
    namespace 'v1' do
      resources :users
      put '/users', to: 'users#update'
      post '/auth/login', to: 'authentication#login'
    end
  end

  namespace :admin do
    resources :users, except: [:index]
  end
end
