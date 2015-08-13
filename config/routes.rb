Rails.application.routes.draw do

  get 'likes/create'

  get 'likes/destroy'

  devise_for :users
  resources :topics
  resources :bookmarks

  resources :users, only: [:update, :show, :index] do
    resources :topics, shallow: true do
      resources :bookmarks, shallow: true do
        resources :likes, only: [:create, :destroy]
      end
    end
  end

  resources :likes, only: [:edit, :index, :new, :show]

  get 'welcome/index'
  get 'welcome/about'
  get 'about' => 'welcome#about'
  root 'welcome#index'

  post :incoming, to: 'incoming#create'

end
