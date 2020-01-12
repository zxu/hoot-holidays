Rails.application.routes.draw do
  resources :carriers

  get :auto_complete, controller: :main
  get :search, controller: :main
  post :passenger, controller: :main
  post '/nav_back/:from', controller: :nav, action: :main, as: :nav_back

  root to: "main#index"
end
