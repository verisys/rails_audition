Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }
  resources :homes, only: [:index]

  root to: 'homes#index'
end
