Rails.application.routes.draw do
  resources :goals
  resources :class_standing, only: %i[index create]
  resources :experience
  resources :timeline

  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'auth/logout' => 'logout#logout'

  root 'class_standing#index'
end
