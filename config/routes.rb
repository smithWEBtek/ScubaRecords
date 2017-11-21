Rails.application.routes.draw do

  devise_for :users

  root 'sites#index'

  resources :users do
    resources :sites
  end

  resources :records
  
end
