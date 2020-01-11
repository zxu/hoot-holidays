Rails.application.routes.draw do
  resources :carriers

  get :search, controller: :main
  root to: "main#index"
end
