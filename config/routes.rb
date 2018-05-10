Rails.application.routes.draw do
  root 'pages#home'
  
  get '/jobs', to: 'pages#incomplete_jobs'
  get '/jobs/index', to: 'jobs#index'
  # resources :jobs

  # get '/requests/index', to: 'requests#index'
  # get '/requests/show', to: 'requests#show'
  # post '/requests/new', to: 'requests#new'
  # post '/requests/show', to: 'requests#create'
  
  resources :jobs do
    member do
      post :booking
    end
  end

  resources :requests
  devise_for :users

  get '/contact', to: 'pages#show'
  post '/contact', to: 'pages#contact_email'

  get '/profile', to: 'profiles#show'
  post '/profile', to: 'profiles#create'
  get '/profile/edit', to: 'profiles#edit'
  patch '/profile', to: 'profiles#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
