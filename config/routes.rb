Rails.application.routes.draw do
  root to: "contacts#index"
  resources :departments
  resources :contacts
end
