Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :packages
  # resources :pages
  resources :pick_ups

  resources :users do
    resources :pick_ups
  end
end
