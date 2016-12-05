Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  
  get '/help', to: 'static_pages#help'
  
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :locations
  resources :vehicles
  
  get '/vehicles/:id/sell', to: 'vehicles#sell', as: 'sell_vehicle'
  patch '/vehicles/:id/sold', to: 'vehicles#sold'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
