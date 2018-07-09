class SessionsController < ApplicationController
    
    def new
     #to render the form
    end
    
    def create
        photographer = Photographer.find_by(email: params[:session][:email].downcase)
        if photographer && photographer.authenticate(params[:session][:password])
         session[:photographer_id] = photographer.id
         flash[:success] = "you have successfully logged in"
         redirect_to photographer
        else
            flash.now[:danger] = "login not valid"
            render 'new'
        end
    end
    
    def destroy
    session[:photographer_id]= nil
    flash[:success]= "Logged Out"
    redirect_to root_path
    end
    
end