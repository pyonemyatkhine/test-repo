Rails.application.routes.draw do
  get 'orders/index'

  get 'orders/show'

  get 'order_details/index'

  get 'order_details/show'

  resources :order_details
  
  resources :orders, only: [:index,:show,:new,:create]
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
