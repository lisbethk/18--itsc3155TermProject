Rails.application.routes.draw do
  get 'welcome/index'
  resources :welcome
  resources :class_standing, only: [:index, :create]
  resources :timeline, only: [:index]
  
  root 'class_standing#index'
end
