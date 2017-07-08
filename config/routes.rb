Rails.application.routes.draw do
  get 'overview/index'    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'overview#index'
end
