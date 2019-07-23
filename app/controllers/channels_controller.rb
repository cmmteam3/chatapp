class ChannelsController < ApplicationController

  
  def new

         @channel= Channel.new
         @workspace= Workspace.find(params[:id])
         @channels=Channel.where(:workspace_id => @workspace.id)
         @message = Message.new
        # @recipient = User.find(params[:user_id])
  end
 def index
    @channels = Channel.all
    #@messages = User.all.find_by(id: current_user).messages
  end
  
 def create

      @channel = Channel.new(name:params[:name],workspace_id:params[:workspace_id],privacy:params[:privacy])

      
       #@message=Message.new()
       @workspace= Workspace.find(params[:workspace_id])
        
         @channel.save
        # @user_channel = Invite.new(:user => current_user, :channel => @channel, :role => "owner")
            #@user_channel.save

       @channel.save
       @user_channel =ChannelsUser.new(:user => current_user, :channel => @channel, :role => "owner")
       @user_channel.save
       @workspace= Workspace.find(params[:workspace_id])
       session[:channels_list]=@channel.id

            redirect_to workspace_path(@workspace)
  end

  def search  
  end


 def edit
    @channel = Channel.find(params[:id])
    @currentWorkspace=Workspace.find_by_id(session[:current_workspace])
    @channels=Channel.where(:workspace_id => @currentWorkspace.id)
  
  end

  def update
      @channel = Channel.find(params[:id])
      @channel.update(channel_params)
     
      @workspace=Workspace.find(session[:current_workspace])
       redirect_to workspace_path(@workspace)
  end

  def show
     @channel= Channel.find(params[:id])

     @message=Message.new
     @thread=ThreadReply.new
     @threadList=ThreadReply.all
     @messages=Message.all.includes(:user).where(channel_id: @channel)
     @currentWorkspace=Workspace.find_by_id(session[:current_workspace])
     @channels=Channel.where(:workspace_id => @currentWorkspace.id)
     @messages = Message.paginate(:page => params[:page], :per_page => 4)
  end

  def destroy
     Channel.find(params[:id]).destroy
     @workspace=Workspace.find(session[:current_workspace])
     redirect_to workspace_path(@workspace)
     
  end

  def check_for_cancel
  if params[:commit] == "Cancel"
    redirect_to channel_path
  end
end
  
   private

  def channel_params
    params.require(:channel).permit(:name,:workspace_id,:privacy)
  end

end