Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'extra#new'

  get 'goodbye', to: 'application#goodbye'
  get 'extra', to: 'application#extra'
  get 'log_out', to: 'extra#new'
end
