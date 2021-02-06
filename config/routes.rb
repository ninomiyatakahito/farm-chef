Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  root to:'posts#index'
  resources :posts do
    resources :comments
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
  resources :users, only: :show
end
