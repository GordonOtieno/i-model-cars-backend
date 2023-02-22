Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do
      resources :users , only: [:create]
      resources :cars, only: [:index]
      resources :users, only: [:show] do
        resources :cars, only: [:create, :destroy]
        resources :reservations, only: [:create, :index]

      end
    end
  end
end
