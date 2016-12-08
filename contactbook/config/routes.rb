Rails.application.routes.draw do
	root 'supervisors#login'
  resources :departments, only: [:index], :path => '/' do
    resources :contacts, except: [:show] do
    	 get "toggle_inactive", :on => :member
    end
  end
end
