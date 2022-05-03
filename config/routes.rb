Rails.application.routes.draw do
  devise_for :users
  root 'shops#index'
  resources :shops
  get '/mypage', to: 'users#index'
end
