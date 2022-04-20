Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "main#index"

  get "/products", to: "products#index"
  get '/products/:id', to: "products#show"
  get '/about/', to: "about#index"
  get '/contact/', to: "contact#index"
  get 'cart', to: "cart#index", as: "cart"
  get "invoice", to: 'order#invoice', as: "invoice"
  get "order", to: 'order#index', as: "order"

  post "invoice/place_order", to: 'order#place_order', as: 'place_order'
  post 'cart/add_to_cart/:id', to: 'cart#add_to_cart', as: 'add_to_cart'
  post 'cart/modify_cart_quantity/:id', to: 'cart#modify_cart_quantity', as: 'modify_cart_quantity'
  delete 'cart/remove_from_cart/:id', to: 'cart#remove_from_cart', as: 'remove_from_cart'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
