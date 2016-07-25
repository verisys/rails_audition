Rails.application.routes.draw do
  root 'locations#index'

  resources :locations do
    resources :cars
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
