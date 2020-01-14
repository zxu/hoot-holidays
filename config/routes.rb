Rails.application.routes.draw do
  resources :carriers
  resources :trips

  get :auto_complete, controller: :main
  get :search, controller: :main
  post :choose_flight, controller: :main
  post :passenger, controller: :main
  post :payment, controller: :main
  post :book, controller: :main

  root to: "main#index"
end
