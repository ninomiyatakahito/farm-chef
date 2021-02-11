Rails.application.routes.draw do
  get 'followings/index'
  devise_for :users
  get 'posts/index'
  root to:'posts#home'
  resources :posts do
    resources :comments
    resources :likes
    
    member do
      get 'home'
    end
  end
  resources :users
  resources :relationships, only: [:create, :destroy]

  resources :messages, :only => [:create, :index]
  resources :rooms, :only => [:create, :show, :index]
  
end

