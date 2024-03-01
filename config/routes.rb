Rails.application.routes.draw do
  namespace :api do
    resources :boats, only: [:index, :show, :create]
    resources :users, param: :username, only: [:show]
  end
end