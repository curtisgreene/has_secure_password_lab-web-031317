Rails.application.routes.draw do

  get '/signup', to: 'users#new', as: :signup
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: :homepage
  get '/login', to: 'sessions#new', as: :login
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

end
