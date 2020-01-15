Rails.application.routes.draw do
  get 'carriers/new'
  get 'carriers/create'
  get 'carriers/index'
  get 'carriers/show'
  get 'carriers/edit'
  get 'carriers/update'
  get 'carriers/destroy'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


  resources :carriers
  resources :trips
  resources :users, except: [:index]

  get '/map/map' => 'users#map'

  get :auto_complete, controller: :main
  get :search, controller: :main
  post :choose_flight, controller: :main
  post :passenger, controller: :main
  post :payment, controller: :main
  post :book, controller: :main

  root to: "main#index"
end
