Rails.application.routes.draw do
  resources :line_items
  resources :carts, only: [:show, :index, :edit, :destroy]
  resources :products
  resources :articles
  resources :orders, only: [:index, :show, :new, :create]
  resources :payments, only: [:new, :create]
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'users/sessions', confirmations: 'confirmations' }
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/contact'
  get 'home/search'
  get 'home/about'
  get 'home/index'
  get 'home/landing'
  post 'home/thank_you'
  root 'articles#index'
end
