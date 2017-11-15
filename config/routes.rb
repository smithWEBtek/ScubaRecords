Rails.application.routes.draw do

  devise_for :users
  
  root 'sites#index'

  resources :sites
  resources :records

end
