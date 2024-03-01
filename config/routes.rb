Rails.application.routes.draw do
  namespace :api do
    resources :boats, only: [:index, :show, :create]
    resources :users, only: [:index, :show, :create]
  end
end