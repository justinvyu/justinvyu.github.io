Rails.application.routes.draw do
  get 'contact' => 'contact#index'
  get 'about' => 'about#index'
  root 'welcome#index'
  resources :posts
end
