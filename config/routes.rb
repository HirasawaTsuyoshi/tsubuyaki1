Rails.application.routes.draw do
  devise_for :authors
  resources :posts
  root 'posts#index'
  resources :comments, except: [:index, :show]

  # イイネ用　
  resources :post do
    resources :likes, only: [:create, :destroy]
  end



end
