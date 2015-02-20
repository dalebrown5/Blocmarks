Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show, :index]

  resources :topics do
    resources :bookmarks, only: [:show, :create, :update]
  end

  post :incoming, to: 'incoming#create'
  
  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
end
