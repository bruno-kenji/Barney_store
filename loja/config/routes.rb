Loja::Application.routes.draw do
  get "operator/index"
  resources :sectors
  resources :operators
  resources :categories

  get "store/index"
  resources :products
  
  root 'store#index'
end