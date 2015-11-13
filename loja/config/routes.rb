Loja::Application.routes.draw do
  get "sectors/index"
  resources :operators

  get "store/index"
  resources :products
  
  root 'test#index'
end