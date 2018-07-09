class PhotographersController < ApplicationController
    
    before_action:set_photographer, only: [:show, :edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]
    
    def index
        @photographers = Photographer.paginate(:page => params[:page], :per_page => 5)
    end
    
    def new
        @photographer = Photographer.new
    end
    
    def create
        @photographer = Photographer.new(photographer_params)
        if @photographer.save
            session[:photographer_id]=@photographer.id
            flash[:success] = "Welcome #{@photographer.togname} to Pik!"
            redirect_to photographer_path(@photographer)
        else
            render 'new'
        end
    end
    
    def show
        @photographer_themes = @photographer.themes.paginate(:page => params[:page], :per_page => 5)
    end
    
    def edit
        
    end
    
    def update
        if @photographer.update(photographer_params)
            flash[:success] = "Account updated successfully"
            redirect_to @photographer
        else
            render 'edit'
        end
    end
    
    def destroy
        if !@photographer.admin?
        @photographer.destroy
        flash[:danger]="photographer and all associated themes have been deleted"
        redirect_to photographers_path
        end
    end
    
    private
    
    def photographer_params
        params.require(:photographer).permit(:togname, :email, :password, :password_confirmation)
    end
    
    def set_photographer
        @photographer= Photographer.find(params[:id])
    end
    
    def require_same_user
        if current_photographer != @photographer and !current_photographer.admin
            flash[:danger] = "You cannot edit or delete another's account"
            redirect_to photographers_path
        end
    end
    
    def require_admin
        if logged_in? &!current_photographer.admin?
            flash[:danger] = "Admin rights required to perform this action"
            redirect_to root_path
        end
    end
end