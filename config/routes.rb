Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'events#index'
  resources :users, only: [:show, :edit, :update]
  resources :events do
    collection do
      get 'search'
    end
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

end
