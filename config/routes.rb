Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, except: :index do
    resources :comments, only: [:create, :destroy]
    resources :orders, only: [:index, :create]
    resources :likes, only: [:create, :destroy]
  end  
end
