Rails.application.routes.draw do

  root 'venues#index'

  get 'venues/saved' => 'venues#saved'
  get 'venues' => 'venues#my_venues'

  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/account' => 'users#show'
  get '/edit_password' => 'users#edit_password'
  patch '/update_password' => 'users#update_password'

  resources :venues
  resources :users
  resources :likes
  resources :holds
  resources :photos

end
