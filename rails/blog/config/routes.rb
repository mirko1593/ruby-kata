require_relative 'environment'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  # @sg-ignore
  # get '/articles', to: 'articles#index'
  resources :articles do
    resources :comments
  end
  # get '/articles/:id', to: 'articles#show'
end
