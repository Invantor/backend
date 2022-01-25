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
    ### Alcohols endpoints
    get '/alcohols', to: "alcohols#index"
    get '/alcohols/:id', to: "alcohols#show"
    post '/alcohols', to: "alcohols#create"
    put '/alcohols/:id', to: "alcohols#update"
    delete '/alcohols/:id', to: 'alcohols#destroy'
    ### Mixers endpoints
    get '/mixers', to: "mixers#index"
    get '/mixers/:id', to: "mixers#show"
    post '/mixers', to: "mixers#create"
    put '/mixers/:id', to: "mixers#update"
    delete '/mixers/:id', to: 'mixers#destroy'
    ### Drinks endpoints
    get '/drinks', to: "mixers#index"
    get '/drinks/:id', to: "mixers#show"
    post '/drinks', to: "mixers#create"
    put '/drinks/:id', to: "mixers#update"
    delete '/drinks/:id', to: 'mixers#destroy'
    


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
