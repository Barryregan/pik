Rails.application.routes.draw do
 root "pages#home"
 get 'pages/home', to: 'pages#home'
 
 get '/themes', to: 'themes#index'

end
