Loja::Application.routes.draw do
  resources :sectors
  resources :operators

  get "store/index"
  resources :products
  
  root 'store#index'
end