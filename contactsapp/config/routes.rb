Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }

  resources :homes, only: [:index]

  resources :departments do
    resources :contacts
  end

  root to: "homes#index"
end
