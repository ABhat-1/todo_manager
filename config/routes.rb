Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :todos
  post "todos", to: "todos#create"
  resources :users
  post "users", to: "users#create"
  post "users/login", to: "users#login"
end
