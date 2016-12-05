Rails.application.routes.draw do
  resources :sales
  resources :vehicles
  resources :locations
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
