Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :kids do
      resources :events, except: [:index, :show]
    end
  end

  resources :users, only: [:new, :create, :show]

  resources :kids, only: [:show, :index]
end
