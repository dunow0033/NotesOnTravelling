Rails.application.routes.draw do

  root 'application#home'
    
  get '/signup' => 'users#new', as: 'signup'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/sessions', to: 'sessions#destroy'

  resources :users
  resources :notes
  resources :destinations
end
