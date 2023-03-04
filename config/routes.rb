Rails.application.routes.draw do
  resources :tasks
  get 'users', to: "users#index", as: "users"
  get 'users/new', to: "users#new", as: "new_user"
  get 'users/:id', to: "users#show", as: "user"
  post 'users', to: "users#create"
end
