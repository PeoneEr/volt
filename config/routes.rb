Rails.application.routes.draw do
  concern :taskable do
    resources :tasks do
      get :download, on: :member
    end
  end

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]
  concerns [:taskable]

  root to: 'tasks#index'

  namespace :my do
    concerns [:taskable]

    root to: 'tasks#index'
  end
end
