  class WorkspacesController < ApplicationController
    def new
      @workspace=Workspace.new
      @currentWorkspace=Workspace.all
    end
    def index
     logger.debug "......Index......"
     @workspace=Workspace.all
     @workspace_list = User.all
     @usersworkspace=UsersWorkspace.all
     @works = User.all.find_by(id: current_user).users_workspace
     @workspace_list = User.all.find_by(id: current_user.id).workspaces.page(params[:page]).per(5)
     @channelsuser=User.all.find_by(id: current_user).channels_user
     @cu = ChannelsUser.all
   end

   def show
     logger.info "......Show......"
     @cu = ChannelsUser.all
     @workspace=Workspace.find(params[:id])
     @channels=Channel.where(:workspace_id => @workspace.id)
     session[:current_workspace]=@workspace.id
     @usersworkspace=User.all.find_by(id: current_user).users_workspace
     @channelsuser=User.all.find_by(id: current_user).channels_user
     @works = User.all.find_by(id: current_user).users_workspace
   end


   def create
    logger.info "......Create......"
    @workspace=Workspace.new(workspace_params)
    if @workspace.save
      @current=Workspace.last
      @currentWorkspace= UsersWorkspace.new(user_id:current_user.id,workspace_id:@current.id, :role => "owner")
      @currentWorkspace.save
      session[:current_workspace]=@workspace.id
      @usersworkspace=UsersWorkspace.all
      @channelsuser=User.all.find_by(id: current_user).channels_user
      @works = User.all.find_by(id: current_user).users_workspace
      flash[:notice] = t(:"Create Workspace Successfully")
      render :action => 'show'
    else
     flash[:alert] = t(:"Create Workspaace fail")
     render 'new'
   end
 end
 def edit
   @cu = ChannelsUser.all
   @works = User.all.find_by(id: current_user).users_workspace
   @workspace = Workspace.find(params[:id])
   @channels=Channel.where(:workspace_id => @workspace.id)

   
 end

 def update
   @cu = ChannelsUser.all
   @works = User.all.find_by(id: current_user).users_workspace
   @workspace = Workspace.find(params[:id])
   if @workspace.update(workspace_params)
     flash[:notice] = t(:"Update successful")
     redirect_to :action =>"show"
   else
      # flash[:alert] = t(:"Update fail")
      render "edit"
    end
  end

  def destroy
    @cu = ChannelsUser.all
    @works = User.all.find_by(id: current_user).users_workspace
    Workspace.find(params[:id]).destroy
    flash[:success] = t(:"Wokspace destroy successful")
    redirect_to :controller => 'workspaces', :action => 'index'
  end
  
  
  
  private

  def workspace_params
   params.require(:workspace).permit(:name)
 end



 def channel_params
  params.require(:channel).permit(:name,:workspace_id)
end
end
