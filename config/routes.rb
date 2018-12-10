Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  resources :articles
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
