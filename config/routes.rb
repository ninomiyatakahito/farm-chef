Rails.application.routes.draw do
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
end

