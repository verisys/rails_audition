 Rails.application.routes.draw do
  root 'locations#index'

  get 'all_cars', to: 'cars#all_cars'

  resources :locations do
    # get 'sell_car', to: 'cars#sell_car', as: 'sell_car'
    resources :cars do
      get 'sell'
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
