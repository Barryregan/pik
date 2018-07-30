class ThemesController < ApplicationController
    before_action :set_theme, only: [:show, :edit, :update, :destroy, :like]
    before_action :require_user, except: [:index, :show, :like]
    before_action :require_same_user, only:[:edit, :update, :destroy]
    before_action :require_user_like, only: [:like]
     
    
    def index
        @themes = Theme.paginate(:page => params[:page], :per_page => 5)
    end
    
    def show
        @comment = Comment.new
        @comments = @theme.comments.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @theme = Theme.new
    end
    
    def create
        @theme = Theme.new(theme_params)
        @theme.photographer = current_photographer
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
    
    def like
        like = Like.create(like: params[:like], photographer: current_photographer, theme: @theme)
        if like.valid?
            flash[:success]= "Thank you: Opinion registered"
            redirect_to :back
        else
            flash[:danger]= "Your opinion of this theme is already registered"
            redirect_to :back
        end
    end
    
   
    
    
    private
    
    def set_theme
        @theme = Theme.find(params[:id])
    end
    
    def theme_params
        params.require(:theme).permit(:name, :description, :image, tool_ids:[])
    end
    
    def require_same_user
        if current_photographer != @theme.photographer and !current_photographer.admin?
            flash[:danger] = "You cannot edit or delete another's themes"
            redirect_to themes_path
        end
    end
    
    def require_user_like
       if!logged_in?
           flash[:danger]="You must be logged in"
           redirect_to :back
    end
    
end