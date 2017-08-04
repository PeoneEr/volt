Rails.application.routes.draw do
  resources :tasks
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root to: 'tasks#index'
end
