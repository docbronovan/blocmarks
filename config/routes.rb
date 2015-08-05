Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/update'

  get 'users/index'

  get 'users/show'

  get 'users/update'

  devise_for :users
  resources :topics
  resources :urls
  resources :users, only: [:update, :show, :index]
  
  get 'welcome/index'
  get 'welcome/about'
  get 'about' => 'welcome#about'
  root 'welcome#index'

end
