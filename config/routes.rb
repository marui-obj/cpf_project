Rails.application.routes.draw do
  get 'departments/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'welcome', to: 'sessions#welcome'
end
