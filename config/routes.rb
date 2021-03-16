Rails.application.routes.draw do
  devise_for :users
  root 'dashboards#index'

  get 'grocery_lists/finished_shopping'

  resources :users, except: [:new, :create]
  resources :meals
  resources :groceries
  resources :measurements
  resources :ingredients do
    member do
      get :update_single_status, as: 'update_single_status'
      get :update_multiple_status, as: 'update_multiple_status'
    end
  end
  resources :cuisines
  resources :side_categories
  resources :entrees
  resources :sides
  resources :staples do
    member do
      get :update_staple_status, as: 'update_staple_status'
      get :update_staple_card_status, as: 'update_staple_card_status'
    end
  end
  resources :recipes
end
