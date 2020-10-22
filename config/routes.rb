Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    get 'orders/index'
  end
end
