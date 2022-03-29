Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "main#index"

  get "/products", to: "products#index"
  get '/products/:id', to: "products#show"
  get '/about/', to: "about#index"
  get '/contact/', to: "contact#index"
  
  # Defines the root path route ("/")
  # root "articles#index"
end
