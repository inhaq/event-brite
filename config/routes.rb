Rails.application.routes.draw do
  get 'events/new'
  root 'users#new'
  get 'logout', to: 'users#logout'
  resources :users, only: [:new, :create, :show]
  resources :events do
    resources :attendees
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
