Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products
    resources :news
    resources :users
  end

  resources :products, only: [:show, :index]
  resources :news, only: [:show, :index]
  resource :search, only: [:show, :create, :new]

  root 'welcome#index'
  get 'welcome/contacts'
  get 'welcome/partners'
  get 'welcome/about_company'
  get 'welcome/mk'

end
