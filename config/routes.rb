Rails.application.routes.draw do

  devise_for :users

  root 'welcome#home'

  resources :users do
    resources :sites
  end

  resources :sites, only: [:index, :show]

  resources :sites do
    resources :records
  end

end
