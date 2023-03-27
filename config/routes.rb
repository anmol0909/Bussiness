Rails.application.routes.draw do
  resources :wishlists do
    member do
      get :remove_from_wishlist, to: "wishlists#destroy"
    end
  end
  resources :carts do
    member do
      get :order ,to: 'orders#create'
      get :remove_from_cart, to: "carts#destroy"
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :merchants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  resources :categories
  resources :products
  resources :idproofs
  resources :orders
  resources :products do
  member do 
    get :cart , to: 'carts#cart'
    get :wishlist, to: 'wishlists#create'
  end
    resources :productimages
  end
end
  