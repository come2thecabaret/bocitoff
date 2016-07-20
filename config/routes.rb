Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'welcome/about'

  root 'welcome#index'
end
