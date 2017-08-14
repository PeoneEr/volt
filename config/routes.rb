Rails.application.routes.draw do
  concern :taskable do
    resources :tasks do
      member do
        get :download

        %i[to_new to_started to_finished].each do |action|
          put action
        end
      end
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
