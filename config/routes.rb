Rails.application.routes.draw do
  get    'tasks'     => 'tasks#index'
  post   'tasks'     => 'tasks#store'
  get    'tasks/:id' => 'tasks#show'
  put    'tasks/:id' => 'tasks#update'
  delete 'tasks/:id' => 'tasks#destroy'
  devise_for :users
  root to: "tops#index"
  resources :users, only: [:show, :edit, :update]
end