Rails.application.routes.draw do
  resources :quantities, only: [:create]
  resources :materials
  devise_for :users, except: [:destroy]
  root to: 'pages#home'
  get 'logs', to: 'pages#logs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
