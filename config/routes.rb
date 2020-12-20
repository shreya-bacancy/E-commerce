Rails.application.routes.draw do
  get 'transactions/new'
  get 'contacts/index'
  get 'search/index'
  get 'carts/show'
  devise_for :suppliers
  get 'products/smartphone_index'
  get 'products/computer_index'
  get 'products/camera_index'
  get 'products/tv_index'
  resources :products 	

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
