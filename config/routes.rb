Rails.application.routes.draw do
  get 'class_standing/index'
  root 'class_standing#index'
end
