# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do 
    namespace :v1 do
      root to: 'sessions#index'
      post 'users/login', to: 'sessions#create'
      post '/logout', to: 'sessions#destroy' 
      post 'users/signup', to: 'users#create'
    end
  end
end
