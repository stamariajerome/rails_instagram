Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  # Collection Routes
  resources :collections

  # User Routes
  get '/register', :to => 'users#new'
  resources :users, :except => [:new]
end
