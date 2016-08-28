Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }

  resources :homes, only: [:index]
  resources :locations, execpt: [:show, :destroy]

  root to: 'homes#index'
end
