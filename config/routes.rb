Rails.application.routes.draw do

  devise_for :users

  root 'welcome#home'

  resources :users do
    resources :sites, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :sites, only: [:index, :show]

  resources :records

end
