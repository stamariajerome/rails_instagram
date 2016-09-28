Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  # Collection Routes
  resources :collections

  # User Routes
  get '/register', :to => 'users#new'
  resources :users, :except => [:new]

  # Session Routes
  get '/login', :to => 'sessions#new'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
end
