Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/store'
  get 'tasks/update'
  get 'tasks/destroy'
  devise_for :users
  root to: "tops#index"
  resources :users, only: [:show, :edit, :update]
end