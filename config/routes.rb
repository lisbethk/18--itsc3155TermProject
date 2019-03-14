Rails.application.routes.draw do
  get 'welcome/index'
  resources :welcome
  resources :class_standing, only: [:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'class_standing#index'
end
