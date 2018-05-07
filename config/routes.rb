Rails.application.routes.draw do

  get 'requests/index'
  get 'requests/new'
  get 'requests/create'
  root 'pages#home'

  devise_for :users

  get '/profile', to: 'profiles#show'
  post '/profile', to: 'profiles#create'
  get '/profile/edit', to: 'profiles#edit'
  patch '/profile', to: 'profiles#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
