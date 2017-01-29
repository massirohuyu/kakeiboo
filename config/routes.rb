Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'top#index'

  namespace :api do
    resources :entries, except: [:new, :edit], format: 'json'
  end

  resources :books, only: [:index, :show]

  get  'login'  => 'user_sessions#new', as: 'login'
  post 'logout' => 'user_sessions#destroy', as: 'logout'
  resources :user_sessions, only: %i(create)
end
