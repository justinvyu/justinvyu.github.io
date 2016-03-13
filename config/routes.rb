Rails.application.routes.draw do
  devise_for :users
  resources :posts

  get 'contact' => 'contact#index'
  get 'about' => 'about#index'
  root 'welcome#index'

  get '*path' => redirect('/')
end
