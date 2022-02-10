Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'events#index'
  resources :users, only: [:show, :edit, :update]
  resources :events
end
