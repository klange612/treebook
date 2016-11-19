Rails.application.routes.draw do

  get 'profiles/show/:id', to: 'profiles#show'

  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :login
    get 'register', to: 'devise/registrations#new', as: :register
    get 'logout', to: 'devise/sessions#destroy', as: :logout
    get 'account', to: 'devise/registrations#edit', as: :account
  end

  root to: "statuses#index"

  resources :statuses
  get 'new', to: 'statuses#new', as: :new

  get ':id', to: 'profiles#show'

end
