Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do
      resources :users , only: [:create]
      resources :cars, only: [:index, :show]
      resources :users, only: [:show], param: :user_name do
        resources :cars, only: [:create, :destroy]
        resources :reservations, only: [:create, :index]

      end
    end
  end
end
