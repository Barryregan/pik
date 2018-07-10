class CommentsController < ApplicationController
    before_action :require_user
    
    def create
        @theme = Theme.find(params[:theme_id])
        @comment = @theme.comments.build(comment_params)
        @comment.photographer = current_photographer
        if @comment.save
            flash[:success] = "Comment created"
            redirect_to theme_path(@theme)
        else
            flash[:danger] = "Comment not created"
            redirect_back fallback_location:@theme
        end
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:description)
    end
    
end