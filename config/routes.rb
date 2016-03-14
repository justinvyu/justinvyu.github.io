Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :contacts, only: [:new, :create]

  get 'contact' => 'contacts#new'
  get 'contact#create' => redirect('/')
  get 'about' => 'about#index'
  root 'welcome#index'

  get '*path' => redirect('/')
end
