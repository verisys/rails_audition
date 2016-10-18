Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  resources :departments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "departments#index"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/devel/emails"
  end
  
end
