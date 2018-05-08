Rails.application.routes.draw do
  root 'pages#home'
  
  get '/jobs', to: 'pages#incomplete_jobs'
  resources :jobs

  # get '/requests/index', to: 'requests#index'
  # get '/requests/show', to: 'requests#show'
  # post '/requests/new', to: 'requests#new'
  # post '/requests/show', to: 'requests#create'
  
  resources :requests
  devise_for :users

  get '/contact', to: 'pages#contact'

  get '/profile', to: 'profiles#show'
  post '/profile', to: 'profiles#create'
  get '/profile/edit', to: 'profiles#edit'
  patch '/profile', to: 'profiles#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
