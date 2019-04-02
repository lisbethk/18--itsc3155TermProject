Rails.application.routes.draw do
  get 'welcome/index'
  resources :welcome
  resources :class_standing, only: [:index, :create]
  resources :timeline, only: [:index]
  
  root 'class_standing#index'
  get '/.well-known/acme-challenge/:id' => 'class_standing#letsencrypt', constraints: { :id => /[0-z\.]+/ }
end
