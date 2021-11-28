Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :animals
  resources :users, only: [:show, :edit, :index, :update]
end
