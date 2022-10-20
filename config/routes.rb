Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:create, :update, :index, :show, :destroy, :edit]
  post 'authenticate', to: 'authentication#authenticate'
  resources :users, only: [:create]
end
