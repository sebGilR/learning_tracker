Rails.application.routes.draw do
  root 'users#show'

  resources :users, param: "username", only: [:new, :create] do
    resources :sessions, only: [:index]
  end

  resources :groups, param: "name", only: [:index, :show] do
    resources :sessions, only: [:index]
  end

  resources :sessions, only: [:index, :new, :create]
  resources :logins, only: [:create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'logins#new', as: 'login'
  get 'logout', to: 'logins#destroy', as: 'logout'
end
