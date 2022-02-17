Rails.application.routes.draw do
  #root principal
  root to:'gossips#index' 

  #page team depuis le controller page
  get '/team', to: 'page#team', as: 'team'

  #page contact depuis le controller page
  get '/contact', to: 'page#contact', as: 'contact'

  resources :gossips
  resources :users
  resources :cities
  resource :sessions, only: [:new, :create, :destroy]
end
