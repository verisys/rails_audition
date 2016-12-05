Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vehicles
  resources :locations do
    resources :vehicles do
      resources :sales
    end
  end
  get 'static_pages/home'
  root 'static_pages#home'
end
