Rails.application.routes.draw do

  root 'shared#home'

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :contacts

  put 'contacts/:id/active', to: 'contacts#active', as: 'active_contact'
  post 'contacts/by_department', to: 'contacts#by_department'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
