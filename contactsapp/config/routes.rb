Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }

  resources :homes, only: [:index]

  resources :departments do
    resources :contacts do
      get :change_status, on: :member
      post :change_status, on: :member, to: "contacts#update_status"
    end
  end

  root to: "homes#index"
end
