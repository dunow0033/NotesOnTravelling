Rails.application.routes.draw do

  root 'application#home'
    
  get '/signup' => 'users#new', as: 'signup'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create'

  resources :users
  resources :notes
  resources :destinations do
    resources :notes
  end
end
