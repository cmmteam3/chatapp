class WorkspacesController < ApplicationController
    def new
      @workspace=Workspace.new
      @currentWorkspace=Workspace.all
  end
  def index
     @workspace_list = User.all.find_by(id: current_user).users_workspace
  end

  def show
  	  @workspace= Workspace.find(params[:id])
     @channels=Channel.where(:workspace_id => @workspace.id)
     session[:current_workspace]=@workspace.id

end


  def create
  
    @workspace=Workspace.new(workspace_params)
   if @workspace.save
    @current=Workspace.last
    @currentWorkspace= UsersWorkspace.new(user_id:current_user.id,workspace_id:@current.id)
    @currentWorkspace.save
    session[:current_workspace]=@workspace.id
     flash[:success] = "Create Workspace Successfully!"
     render :action => 'show'
  else
    render 'new'
  end

  end

  def edit
    @workspace = Workspace.find(params[:id])

   
  end

  def update
      @workspace = Workspace.find(params[:id])
    if @workspace.update(workspace_params)
       flash[:success] = "Update is  success."
      redirect_to :action =>"show"
       else
      flash[:danger] = "Update is not success."
      render "edit"
    end
  end

   def destroy
     Workspace.find(params[:id]).destroy 
   flash[:success] = "Wokspace destroy is scuccess."
    redirect_to root_path
  end
  
  
  
  private

   def workspace_params
     params.require(:workspace).permit(:name)
  end



  def channel_params
    params.require(:channel).permit(:name,:workspace_id)
  end
end
