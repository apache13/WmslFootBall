Rails.application.routes.draw do
 
  resources :bets
  resources :matches
  resources :configs
  resources :groups
  resources :teams
  resources :users
  get 'overview/index'
  get 'sessions/login'
  
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/signin_facebook' => 'sessions#new_facebook', :as => :signin_facebook
  get '/signin_google' => 'sessions#new_google', :as => :signin_google
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'overview#index'
end
