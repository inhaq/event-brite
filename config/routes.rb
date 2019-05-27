Rails.application.routes.draw do
  root 'statics#show'
  get 'home', to: 'statics#home'
  get 'events/new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  get 'invitations', to: 'attendees#all_invitations'
  post 'accept', to: 'attendees#accept'
  resources :users, only: [:new, :create, :show]
  resources :events do
    resources :attendees
  end

  namespace :api do
    namespace :alpha do 
      resources :users
      resources :events
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
