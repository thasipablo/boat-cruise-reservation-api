Rails.application.routes.draw do

  # ... other routes ...

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Add a custom logout route
  post 'logout', to: 'users/sessions#destroy', as: :logout

  # Health check route
  get 'up', to: 'rails/health#show', as: :rails_health_check
end

  namespace :api do
    resources :boats, only: [:index, :show, :create]
  end
end

