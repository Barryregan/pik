class ToolsController < ApplicationController
   before_action :set_tool, only: [:edit, :update, :show]
   before_action :require_admin, except: [:show, :index]

   def new
      @tool = Tool.new
       
   end
   
   def create
      @tool = Tool.new(tool_params)
      if @tool.save
         flash[:success] = "Tool successfully added"
         redirect_to tool_path(@tool)
      else
         render 'new'
      end
   end
   
   def edit
       
   end
   
   def update
       if @tool.update(tool_params)
          flash[:success] = "Tool item updated successfully"
          redirect_to @tool
       else
          render 'edit'
       end
   end
   
   def show 
      @tool_themes = @tool.themes.paginate(:page => params[:page], :per_page => 5)
   end
   
   def index
       @tools = Tool.paginate(page: params[:page], per_page: 5)
   end
   
   private
   
   def set_tool
      @tool = Tool.find(params[:id])
   end
   
  def tool_params
     params.require(:tool).permit(:name)
  end
  
  def require_admin
      if !logged_in? || (logged_in? and !current_photographer.admin?)
         flash[:danger] = "access for this action restricted to Admin"
         redirect_to tools_path
      end
  end
   
   
end