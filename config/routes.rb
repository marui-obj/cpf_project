Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => redirect('/login')
  
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :departments, only:[:new, :create, :show] do
    resources :shifts
  end
  resources :employees

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  put '/employees', to: 'employees#update'

  get '/departments', to: 'departments#index'
  get '/departments/:date', to: 'department#change_day'


end
