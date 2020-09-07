Rails.application.routes.draw do
  get "/" => "home#index"
  get "/" => "home#index1"
  get "/" => "delete#destroy"
  patch "additems/:id", to: "additems#update"
  resources :additems, only: [:index, :show, :new, :create, :edit, :update]
  resources :reports
  resources :menus
  resources :menuitems
  resources :orderitems
  resources :todos
  resources :additems
  resources :billitems
  resources :usermain
  resources :orders
  resources :viewer
  resources :ownerhome
  resources :orderreceived
  resources :orderreceivedbyclerk
  resources :users
  resources :viewusersbyowner

  get "/new" => "users#new", as: :user_sessions
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
