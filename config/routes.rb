Rails.application.routes.draw do
  get 'departments/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :departments

root :to => redirect('/departments')

end
