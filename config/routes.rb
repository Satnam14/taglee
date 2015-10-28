Rails.application.routes.draw do
  root 'static_pages#root'
  get 'users/auth/instagram/callback', to: 'sessions#create'
end
