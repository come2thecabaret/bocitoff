Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'welcome/about'


  authenticated :user do
      root to: 'users#show', as: :authenticated_root
  end
  root 'welcome#index'
end
