class ApplicationController < ActionController::Base

    
    helper_method :current_photographer, :logged_in?
    
    def current_photographer
        @current_photographer ||=Photographer.find(session[:photographer_id]) if session[:photographer_id]
    end
    
    def logged_in?
        !!current_photographer
    end
    
    def require_user
        if !logged_in?
        flash[:danger]="You must be logged in to perform that action"
        redirect_to root_path
        end
    end
    
end
