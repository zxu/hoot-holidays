Rails.application.routes.draw do
  resources :carriers

  get :auto_complete, controller: :main
  get :search, controller: :main
  root to: "main#index"
end
