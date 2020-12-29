Rails.application.routes.draw do
  resources :addresses
  # get 'categories/new'
  # get 'categories/edit'
  # get 'categories/index'
  get 'wishlists/show'
  get 'transactions/new'
  get 'contacts/index'
  get 'search/index'
  get 'carts/show'
  get 'carts/address/:id' , to: 'carts#address_show_add' , as: :address_show_add
  get 'carts/payment_option/:id' , to: 'carts#payment_option' , as: :payment
  get 'carts/payment_success/:id' , to: 'carts#payment_success' , as: :payment_success
  get 'user/orders' , to: 'users#order' , as: :order
  
  
  devise_for :suppliers
  
  # resources :products do
  #   collection do
  #     get 'category/:category_name', to: 'products#product_category_index', as: :product_category
  #   end
  # end

  get 'products/:category_type', to: 'products#category' ,as: :show_category_product
  get 'product/:id', to: 'products#show' ,as: :show_product
  get 'products/:brand_name' , to: 'products#brand', as: :show_brand
  get 'products/:min_price/:mid_price' , to: 'products#price', as: :price
  
  get 'product', to: 'products#new' , as: :new_product
  post 'products', to: 'products#create' , as: :products

 resources :categories

  resources :products , only:[:edit,:update,:index,:destroy]

  get 'search' , to: 'search#search_product' , as: :product_search

  resources :wishlists, only: [:show] 
    post 'wishlists/:product_id' , to: 'wishlists#create', as: :add_to_wishlist
    delete 'wishlists/:product_id' , to: 'wishlists#destroy', as: :delete_from_wishlist
  

  resources :transactions , only: [:new,:create]

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'users/index'
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
