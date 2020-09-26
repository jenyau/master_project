Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root :to=> "welcome#contacts"
    resources :products
    resources :news
    resources :users
  end

  resources :products, only: [:show, :index] do
    get 'biscuits', :on => :collection
    get 'puff_product', :on => :collection
    get 'cake', :on => :collection
    get 'desert', :on => :collection

  end
  resources :news, only: [:show, :index]
  resource :search, only: [:show, :create]
  resources :users, only: [:show]

  root 'welcome#index'
  get 'welcome/contacts'
  get 'welcome/about_company'

end
