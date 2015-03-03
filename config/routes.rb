Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show, :index]

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  post :incoming, to: 'incoming#create'
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
