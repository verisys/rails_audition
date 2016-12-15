Rails.application.routes.draw do
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'contact_active_toggle' => 'contacts#toggle_active_flag'


  root :to => "contacts#index"

end
