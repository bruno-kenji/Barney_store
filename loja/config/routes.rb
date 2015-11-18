Loja::Application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "sessions/create"
  get "sessions/destroy"

  resources :sectors
  resources :operators
  resources :categories
  resources :products

  resources :store, only: [:index, :show]
  
  root 'store#index'
end