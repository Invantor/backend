Rails.application.routes.draw do
  scope '/api' do
    scope '/auth' do
      post '/sign_up', to: 'users#create'
      post '/sign_in', to: 'users#sign_in'
      get '/users', to: 'users#index'
      put '/users/:id', to: 'users#update'
      get '/users/:id', to: 'users#show'
      delete '/users/:id', to: 'users#destroy'
    end
    get '/alcohols', to: "alcohols#index"
    post '/alcohols', to: "alcohols#create"
    put '/alcohols/:id', to: "alcohols#update"
    get '/mixers', to: "mixers#index"
    post '/mixers', to: "mixers#create"
    put '/mixers/:id', to: "mixers#update"


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
