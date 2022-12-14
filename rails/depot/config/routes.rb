Rails.application.routes.draw do
  get 'upload/get'
  post 'upload/save'
  get 'upload/show/:id' => 'upload#show'
  get 'upload/picture/:id' => 'upload#picture'
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  resources :users
  # resources :orders
  # resources :line_items
  # resources :carts
  # root 'store#index', as: 'store_index'

  resources :support_requests, only: %i[index update]

  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
end
