Rails.application.routes.draw do
  root 'static_pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:create, :update, :index, :show, :destroy, :edit]
  post 'authenticate', to: 'authentication#authenticate'
  get 'products_in_range', to: "products#products_in_range"
  get 'search', to: "products#search"
  resources :users, only: [:create, :update, :show]
  resources :shops, only: [:create, :index, :show]
end
