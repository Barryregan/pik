Rails.application.routes.draw do
 root "pages#home"
 get 'pages/home', to: 'pages#home'
 
 resources :themes do
  resources :comments, only: [:create]
  member do
   post 'like'
  end
 end
 
 get '/signup', to: 'photographers#new'
 
 resources :photographers, except: [:new]
 
 get '/login', to: "sessions#new"
 post '/login', to: "sessions#create"
 delete '/logout', to: "sessions#destroy"
 
 resources :tools, except: [:destroy]
 
 mount ActionCable.server => '/cable'
 get '/chat', to: 'chatrooms#show'
 
 resources :messages, only: [:create]
 
end
