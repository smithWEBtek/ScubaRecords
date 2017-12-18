Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'welcome#home'

  resources :users do
    resources :sites
  end

  resources :sites, only: [:index, :show]

  resources :sites do
    resources :records
  end

end
