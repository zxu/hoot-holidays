Rails.application.routes.draw do
  resources :carriers

  get :auto_complete, controller: :main
  get :search, controller: :main
  post :choose_flight, controller: :main
  post :passenger, controller: :main
  post :payment, controller: :main

  root to: "main#index"
end
