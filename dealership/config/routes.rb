Rails.application.routes.draw do
  post '/selling', to: 'sales#selling'
  post '/sales/sold', to: 'sales#sale_complete'

  root to: 'welcome#index'
  resources :vehicles
  resources :locations

  get '/welcome', to: 'welcome#index'

  get 'static_pages/home'
  get 'static_pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
