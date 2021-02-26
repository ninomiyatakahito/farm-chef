Rails.application.routes.draw do
  get 'home/index'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
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
  resources :relationships

  resources :messages, :only => [:create, :index]
  resources :rooms, :only => [:create, :show, :index]
  


end

