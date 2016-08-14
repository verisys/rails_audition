Rails.application.routes.draw do
  resources :contacts, except: :destroy

  root to: redirect('/contacts')
end
