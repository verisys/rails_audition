Rails.application.routes.draw do
  get '/departments/:id/contacts', to: 'departments#contacts', as: :department_contacts

  resources :contacts, except: :destroy do
    post :deactivate, on: :member
  end

  root to: redirect('/contacts')
end
