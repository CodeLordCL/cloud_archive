Rails.application.routes.draw do
  devise_for :users
  root 'user_files#index'
  resources :user_files
  get 'user_files/download/:id', to: 'user_files#download'
  get 'admin/all_files', to: 'admin#all_files'
  get 'admin/clean_cache', to: 'admin#clean_cache'
  resources :admin, only: [:index, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
