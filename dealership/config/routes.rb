Rails.application.routes.draw do
  get 'cars/index'

  get 'cars/show'

  get 'cars/new'

  get 'cars/edit'

  get 'locations/index'

  get 'locations/show'

  get 'locations/new'

  get 'locations/edit'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
