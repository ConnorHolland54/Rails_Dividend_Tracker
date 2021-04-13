Rails.application.routes.draw do
  resources :port_stocks
  resources :stocks
  resources :portfolios do
    resources :stocks, only: [:index]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'portfolios#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  patch '/port_stocks', to: 'port_stocks#update_stock'
end
