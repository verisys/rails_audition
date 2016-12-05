ContactBook::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/contacts', :to => 'contacts#add'
      get '/contacts', :to => 'contacts#list'
      get '/contacts/:id', :to => 'contacts#get'
      put '/contacts/:id', :to => 'contacts#update'
    end
  end
end
