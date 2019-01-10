Rails.application.routes.draw do
  resources :line_items
  resources :carts, only: [:show, :index, :edit]
  resources :products
  resources :articles
  resources :orders, only: [:index, :show, :new, :create]
  resources :payments, only: [:new, :create]
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/contact'
  post 'home/thank_you'
  root 'home#index'
end
