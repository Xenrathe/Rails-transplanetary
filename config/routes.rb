Rails.application.routes.draw do
  resources :bookings, only: [:new, :create, :show]
  resources :flights, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"
end
