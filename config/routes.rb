Rails.application.routes.draw do
  root "tests#index"

  resources :tests do
    resources :questions, shallow: true, except: [:index] do
      resources :answers, shallow: true, except: %i[index]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
