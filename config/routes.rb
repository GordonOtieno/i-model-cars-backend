Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do 
    namespace :v1 do
      resources :users , only: [:create]
      resources :cars, only: [:create, :destroy]
      resources :cars, only: [:index, :show]
      resources :users, only: [:show], param: :user_name
      resources :users, only: [:show] do
        resources :reservations, only: [:create, :index]

      end
    end
  end
end
