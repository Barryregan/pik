Rails.application.routes.draw do
 root "pages#home"
 get 'pages/home', to: 'pages#home'
 
 resources :themes
 
 get '/signup', to: 'photographers#new'
 
 resources :photographers, except: [:new]
 
 get '/login', to: "sessions#new"
 post '/login', to: "sessions#create"
 delete '/logout', to: "sessions#destroy"
 
 
 
end
