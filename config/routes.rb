Rails.application.routes.draw do
  resources :bookings, only: [:new, :create, :show, :index]
  resources :flights, only: [:index]
  resources :spaceports, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"
end
