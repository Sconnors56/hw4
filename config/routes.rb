Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get  "/login",  to: "sessions#new",     as: "login"
  get  "/logout", to: "sessions#destroy", as: "logout"

  get  "/signup", to: "users#new",    as: "signup"
  post "/users",  to: "users#create"

  resources :places, only: [:index, :show, :new, :create] do
    resources :entries, only: [:new, :create]
  end

  root to: "places#index"
end

