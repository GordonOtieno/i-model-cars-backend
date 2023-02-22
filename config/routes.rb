Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do 
    namespace :V1 do
      resources :users , only: [:new, :create]
      resources :cars, only: [:index, :destroy]
      resources :reservations, only: [:index]
      resources :users, only: [:show] do
        resources :cars, only: [:new, :create]
        resources :reservations, only: [:create, :new]
      end
    end
  end
end
