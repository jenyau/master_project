Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/contacts'
  get 'welcome/partners'
  get 'welcome/about_company'
  get 'welcome/mk'

  resources :news
  resources :users
end
