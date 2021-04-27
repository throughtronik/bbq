Rails.application.routes.draw do
  resources :users
  resources :events, only: [:show, :edit, :update]

  root "events#index"
end
