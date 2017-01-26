Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'locations#index'

  get '/all_cars', to: 'cars#all_cars'
  get '/all_employees', to: 'employees#all_employees'

  resources :locations do
    resources :employees
    resources :cars
  end
end
