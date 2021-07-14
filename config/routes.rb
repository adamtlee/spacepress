Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :articles
  resources :users, except: [:new]

  get 'topstories', to: 'pages#topstories'
  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'
end  
