Rails.application.routes.draw do
  get 'pages/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'pages/:id' => 'pages#show'

  root :to => "pages#show"
end
