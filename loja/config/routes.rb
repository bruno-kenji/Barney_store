Loja::Application.routes.draw do
  get "products/index"
  get "products/show"
  get "products/new"
  get "products/edit"
  get "products/create"
  get "products/update"
  get "products/destroy"
  get "orders/index"
  get "orders/show"
  get "orders/new"
  get "orders/edit"
  get "orders/create"
  get "orders/update"
  get "orders/destroy"
  get "operators/index"
  get "store/index"
  root to: 'test#index'
end
