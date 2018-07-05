class ThemesController < ApplicationController
    
    def index
        @themes = Theme.all
    end
    
    def show
        @theme = Theme.find(params[:id])
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
        @theme = Theme.find(params[:id])
    end
    
    
    def update
        @theme = Theme.find(params[:id])
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
    
    def theme_params
        params.require(:theme).permit(:name, :description)
    end
    
end