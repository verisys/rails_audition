Rails.application.routes.draw do
  root 'departments#show'

  resources :departments do 
    resources :contacts
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
