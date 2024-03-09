Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  namespace :api do
    resources :boats, only: [:index, :show, :create, :destroy]
    resources :reservations, only: [:create, :index, :show]
    resources :users, only: [:index, :show, :create] do
    collection do
      post 'login', to: 'users#login'
      delete 'logout', to: 'users#logout'
    end

  end
  end

end
