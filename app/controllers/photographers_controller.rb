class PhotographersController < ApplicationController
    
    def new
        @photographer = Photographer.new
    end
    
    def create
        @photographer = Photographer.new(photographer_params)
        if @photographer.save
            flash[:success] = "Welcome #{@photographer.togname} to Pik!"
            redirect_to photographer_path(@photographer)
        else
            render 'new'
        end
    end
    
    def show
        @photographer = Photographer.find(params[:id])
    end
    
    private
    
    def photographer_params
        params.require(:photographer).permit(:togname, :email, :password, :password_confirmation)
    end
    
end