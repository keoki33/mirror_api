Rails.application.routes.draw do
  post '/email', to: 'users#email'
  resources :commands
  resources :settings
  resources :users
  mount ActionCable.server => '/cable'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
