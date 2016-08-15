Rails.application.routes.draw do
  resources :contacts, except: :destroy do
    post :deactivate, on: :member
  end

  root to: redirect('/contacts')
end
