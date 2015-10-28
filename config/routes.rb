Rails.application.routes.draw do
  root 'static_pages#root'
  get 'users/auth/instagram/callback', to: 'sessions#create'
  resource :session, only: [:destroy]

  resources :users, only: [:show]

  namespace :api, defaults: { format: :json } do
    resources :media, except: [:new, :edit]
    resources :albums
  end
end
