Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => redirect('/login')
  
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :departments do
    resources :shifts
  end

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # put '/departments/:department_id/shifts/:id', to: 'shifts#update', as: :manage_ot

end
