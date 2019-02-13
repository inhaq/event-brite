Rails.application.routes.draw do
  get 'events/new'
  root 'users#new'
  get 'logout', to: 'users#logout'
  get 'invitations', to: 'attendees#all_invitations'
  post 'accept', to: 'attendees#accept'
  resources :users, only: [:new, :create, :show]
  resources :events do
    resources :attendees
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
