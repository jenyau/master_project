Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'welcome/contacts'
  get 'welcome/partners'
  get 'welcome/about_company'
  get 'welcome/mk'

  resources :products
  resources :news
  resources :users
end
