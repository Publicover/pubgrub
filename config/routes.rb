Rails.application.routes.draw do
  devise_for :users
  root 'dashboards#index'

  resources :users, except: [:new, :create]
  resources :meals
  resources :groceries
  resources :measurements
  resources :ingredients
  resources :cuisines
end
