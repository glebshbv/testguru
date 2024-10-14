Rails.application.routes.draw do
  root "tests#index"

  devise_for :users,
              path: "/",
              path_names: { sign_in: :login, sign_up: :register, sign_out: :logout },
              controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
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
      post :gist
    end
  end

  namespace :admin do
    resources :tests
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
