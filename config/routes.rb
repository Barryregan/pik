Rails.application.routes.draw do
 root "pages#home"
 get 'pages/home', to: 'pages#home'
 
 resources :themes
 
 get '/signup', to: 'photographers#new'
 resources :photographers, except: [:new]
 
end
