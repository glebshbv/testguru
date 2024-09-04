Rails.application.routes.draw do
  root "tests#index"

  resources :tests do
    resources :questions, shallow: true, except: %i[ index ] do
      resources :answers, shallow: true, except: %i[ index ]
    end
    member do
      post :start
    end
  end

  resources :results, only: %i[ show result update ]

  get "up" => "rails/health#show", as: :rails_health_check

end
