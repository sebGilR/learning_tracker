Rails.application.routes.draw do
  root 'users#show'

  resources :users, param: "username", only: [:show, :new, :create]

  resources :groups, param: "name", only: [:index, :show, :new, :create]

  resources :sessions, only: [:index, :new, :create, :show]
  resources :logins, only: [:create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'logins#new', as: 'login'
  get 'logout', to: 'logins#destroy', as: 'logout'
end
