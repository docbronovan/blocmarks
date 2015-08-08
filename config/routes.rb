Rails.application.routes.draw do

  devise_for :users
  resources :topics
  resources :bookmarks
  resources :users, only: [:update, :show, :index]
  
  get 'welcome/index'
  get 'welcome/about'
  get 'about' => 'welcome#about'
  root 'welcome#index'

end
