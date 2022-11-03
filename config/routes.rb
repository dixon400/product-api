Rails.application.routes.draw do
 namespace :api do
  resources :products
  resources :users
  resources :categories
  post "/login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'
 end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
