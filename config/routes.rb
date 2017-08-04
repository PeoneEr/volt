Rails.application.routes.draw do
  resources :tasks
  resource :session
  resources :users, only: [:new, :create]

  root to: 'tasks#index'
end
