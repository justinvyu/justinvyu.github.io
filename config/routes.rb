Rails.application.routes.draw do
  devise_for :users
  get 'contact' => 'contact#index'
  get 'about' => 'about#index'
  root 'welcome#index'
  resources :posts
end
