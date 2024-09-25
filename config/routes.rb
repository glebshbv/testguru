Rails.application.routes.draw do
  get 'sessions/new'

  root "tests#index"

  get :signup, to: 'users#new'

  resources :users, only: :create

  get :login, to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy', as: :logout


  resources :sessions, only: :create


  resources :tests do
    resources :questions, shallow: true, except: %i[ index ] do
      resources :answers, shallow: true, except: %i[ index ]
    end
    member do
      post :start
    end
  end

  resources :results, only: %i[ show update ] do
    member do
      get :result
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
