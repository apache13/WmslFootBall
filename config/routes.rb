Rails.application.routes.draw do
 
  resources :groups
  resources :teams
  resources :users
  get 'overview/index'
  get 'sessions/login'
  
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/signin' => 'sessions#new', :as => :signin
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'overview#index'
end
