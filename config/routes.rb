Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'topstories', to: 'pages#topstories'
  resources :articles, only: [:show]
end