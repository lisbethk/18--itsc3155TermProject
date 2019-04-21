Rails.application.routes.draw do  
  resources :class_standing, only: %i[index create]
  resources :experience, only: %i[index create]
  resources :goals, only: %i[index create]
  resources :timeline, only: %i[index update]

  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'auth/logout' => 'logout#logout'

  root 'class_standing#index'
end
