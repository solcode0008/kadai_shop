Rails.application.routes.draw do
  root 'shops#index'
  devise_for :users
  resources :shops
  get '/mypage', to: 'users#mypage'
  resources :users, only: [:index, :show]
end
