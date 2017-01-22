Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :entries
  root 'top#index'

  get  'login'  => 'user_sessions#new', as: 'login'
  post 'logout' => 'user_sessions#destroy', as: 'logout'
  resources :user_sessions, only: %i(create)
end
