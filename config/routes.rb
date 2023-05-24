Rails.application.routes.draw do
  resources :categories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'extra#index'

  get 'goodbye', to: 'application#goodbye'
  get 'extra', to: 'application#extra'
  get 'log_out', to: 'extra#new'
  get 'accounts', to: 'users#index', as: "users"
end
