Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :kids
  end

  resources :users, only: [:new, :create, :show]

  resources :kids, only: [:show, :index]

  resources :events, only: [:edit, :update, :new, :create, :destroy]

end
