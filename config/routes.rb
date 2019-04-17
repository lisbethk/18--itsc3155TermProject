Rails.application.routes.draw do
  resources :welcome
  resources :class_standing, only: [:index, :create]
  resources :experience
  resources :timeline, only: [:index]
  
  get '/.well-known/acme-challenge/:id' => 'class_standing#letsencrypt', constraints: { :id => /[0-z\.]+/ }

  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  get 'dashboard' => 'dashboard#show'

  root 'class_standing#index'
end
