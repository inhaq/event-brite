Rails.application.routes.draw do
  get 'events/new'
  root 'users#new'
  get 'logout', to: 'users#logout'
  resource 'users', only: [:new, :create, :show]
  resource 'events'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
