Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :users, only: [:show, :edit, :update]
  resources :tasks
  resources :advices
  resources :memos
end