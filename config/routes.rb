Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, only: [:show] do
   resources :items, only: [:create]
end

  get 'welcome/about'


  authenticated :user do
      root to: 'users#show', as: :authenticated_root
  end
  root 'welcome#index'
end
