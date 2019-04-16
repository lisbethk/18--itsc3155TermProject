Rails.application.routes.draw do
  resources :welcome
  resources :goals
  resources :class_standing, only: [:index, :create]
  resources :timeline, only: [:index]

  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'auth/logout' => 'logout#logout'

  root 'class_standing#index'
end
