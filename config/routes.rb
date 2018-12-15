Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'welcome#home'

  resources :categories

  resources :users do
    resources :sites
  end

  resources :sites, only: [:index, :show]

  resources :sites do
    resources :records
  end

  get 'records/extreme_dives' => 'records#extreme_dives'

  get 'sites/:id/next' => 'sites#next'

end
