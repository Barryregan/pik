class PagesController < ApplicationController
    
    def home
        redirect_to themes_path if logged_in?
    end
end