class PhotographersController < ApplicationController
    
    def index
        @photographers = Photographer.paginate(:page => params[:page], :per_page => 5)
    end
    
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
        @photographer_themes = @photographer.themes.paginate(:page => params[:page], :per_page => 5)
    end
    
    def edit
        @photographer = Photographer.find(params[:id])
    end
    
    def update
        @photographer = Photographer.find(params[:id])
        if @photographer.update(photographer_params)
            flash[:success] = "Account updated successfully"
            redirect_to @photographer
        else
            render 'edit'
        end
    end
    
    private
    
    def photographer_params
        params.require(:photographer).permit(:togname, :email, :password, :password_confirmation)
    end
    
end