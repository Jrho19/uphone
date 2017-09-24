Rails.application.routes.draw do
  root 'products#index'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/register' => 'users#new'

  resources :users, only: [:new, :create, :destroy] do
    resources :orders
  end

  resources :products, only: [:index, :show] do
    resources :orders, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
