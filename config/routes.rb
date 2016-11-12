Rails.application.routes.draw do

  devise_for :users

  root to: "statuses#index"

  resources :statuses

end
