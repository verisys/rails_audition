Rails.application.routes.draw do
  devise_for :users
  resources :contacts do
    member do 
      get :toggle_active
    end
  end

  resources :departments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "site#landing"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/devel/emails"
  end
  
end
