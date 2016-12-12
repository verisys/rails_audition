Rails.application.routes.draw do
  resources :vehicles
  resources :locations
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/log_in" => "clearance/sessions#new", as: "log_in"
  delete "/log_out" => "clearance/sessions#destroy", as: "log_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
  post 'session' => 'sessions#create', :as => nil

  get 'pages/show'
  #
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'pages/:id' => 'pages#show'

  post "/update_location" => 'vehicles#update_location'
  post "/sell_vehicle" => 'vehicles#sell_vehicle'

  get '/sales' => 'vehicles#sales_report'

  root :to => "pages#show"
end
