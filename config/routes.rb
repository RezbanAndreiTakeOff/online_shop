Rails.application.routes.draw do
  resources :billing_addresses
  resources :shipping_addresses
  resources :categories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'extra#index'

  get 'log_out', to: 'extra#new'
  get 'accounts', to: 'users#index', as: "users"
  get 'my_account', to: 'users#show'
end
