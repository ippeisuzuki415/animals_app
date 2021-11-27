Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :animals, only: [:new, :create, :index, :show, :update, :destroy, :create]
  resources :users, only: [:show, :edit, :index, :update]
end
