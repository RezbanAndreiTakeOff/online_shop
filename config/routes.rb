Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'

  get 'goodbye', to: 'application#goodbye'
  get 'extra', to: 'application#extra'
  get "sign_up", to: 'users#new'
end
