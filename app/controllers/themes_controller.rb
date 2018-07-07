class ThemesController < ApplicationController
    before_action :set_theme, only: [:show, :edit, :update]
     
    
    def index
        @themes = Theme.paginate(:page => params[:page], :per_page => 5)
    end
    
    def show
        
    end
    
    def new
        @theme = Theme.new
    end
    
    def create
        @theme = Theme.new(theme_params)
        @theme.photographer = Photographer.first
        if @theme.save
            flash[:success] = "Theme was created successfully"
            redirect_to theme_path(@theme)
        else
            render 'new'
        end
    end
    
    
    def edit
        
    end
    
    
    def update
       
        if @theme.update(theme_params)
           flash[:success] = "Theme was updated successfully"
           redirect_to theme_path(@theme)
        else
            render 'edit'
        end
    end
    
    def destroy
        Theme.find(params[:id]).destroy
        flash[:success] = "Theme deleted"
        redirect_to themes_path
    end
    
   
    
    
    private
    
    def set_theme
        @theme = Theme.find(params[:id])
    end
    
    def theme_params
        params.require(:theme).permit(:name, :description)
    end
    
end