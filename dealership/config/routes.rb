Rails.application.routes.draw do
  resources :vehicles
  resources :locations
  root to: 'static_pages#home'

  get '/welcome', to: 'welcome#index'

  get 'static_pages/home'
  get 'static_pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
