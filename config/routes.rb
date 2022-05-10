Rails.application.routes.draw do
  resources :weather_statuses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "weather_statuses#index"
end
