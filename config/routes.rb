Rails.application.routes.draw do

  devise_for :users
  resources :topics
  resources :bookmarks

  resources :users, only: [:update, :show, :index] do
    resources :topics, shallow: true do
      resources :bookmarks, shallow: true
    end
  end

  get 'welcome/index'
  get 'welcome/about'
  get 'about' => 'welcome#about'
  root 'welcome#index'

  post :incoming, to: 'incoming#create'

end
