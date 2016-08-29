Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }

  resources :homes, only: [:index]

  resources :vehicles do
    member do
      get :sale
      patch :sale, to: 'vehicles#save_sale'
    end
  end

  resources :locations, execpt: [:show, :destroy]

  root to: 'homes#index'
end
