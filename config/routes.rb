Rails.application.routes.draw do
  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :admin do
    root :to=> "welcome#contacts"
    resources :products
    resources :news
    resources :users do
      patch 'update_mailing_status' => 'users#update_mailing_status'
    end

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
  post 'sending_email' => 'product_mailer#sending_email', as: :sending_email

end
