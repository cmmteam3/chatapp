  class ChannelsController < ApplicationController

    
    def new

     @channel= Channel.new
     @workspace= Workspace.find(params[:id])
     @channels=Channel.where(:workspace_id => @workspace.id)
     @message = Message.new
     @cu = ChannelsUser.all
     #@usersworkspace=UsersWorkspace.all
        end
    def index
          @cu = ChannelsUser.all
          @channels = Channel.all
          @channelsuser = User.all.find_by(id: current_user).channels_user
    
    end
    
    def create

      @channel = Channel.new(name:params[:name],workspace_id:params[:workspace_id],privacy:params[:privacy])
         @workspace= Workspace.find(params[:workspace_id])     
       if@channel.save
              @user_channel =ChannelsUser.new(:user => current_user, :channel => @channel, :role => "owner")
              @user_channel.save
              @workspace= Workspace.find(params[:workspace_id])
              session[:channels_list]=@channel.id
            flash[:notice] = t(:"Channel Successfully create")
              redirect_to workspace_path(@workspace)
        else
          flash[:alert] = t(:"Channel create fail")
          render "new"
           end
            end

            def edit
              @channel = Channel.find(params[:id])
                @cu = ChannelsUser.all
             @workspace=Workspace.find_by_id(session[:current_workspace])
             @channels=Channel.where(:workspace_id => @workspace.id)
             @usersworkspace=UsersWorkspace.all
            @channelsuser=User.all.find_by(id: current_user).channels_user
              
            end

            def update
              @channel = Channel.find(params[:id])
              if @channel.update(channel_params)
              
              @workspace=Workspace.find(session[:current_workspace])
              flash[:notice] = t(:"Channel edit successful")
              redirect_to workspace_path(@workspace)
            else
              flash[:alert] = t(:"Channel edit fail")
              render "edit"
            end
            end

            def show
             @channel= Channel.find(params[:id])
             @usersworkspace=UsersWorkspace.all
             @message=Message.new
             @thread=ThreadReply.new
             @cu = ChannelsUser.all
             @threadList=ThreadReply.all
             @messages=Message.all.includes(:user).where(channel_id: @channel)
              @workspace=Workspace.find_by_id(session[:current_workspace])
             @channels=Channel.where(:workspace_id => @workspace.id)
       
             @usersworkspace=User.all.find_by(id: current_user).users_workspace
            @channelsuser=User.all.find_by(id: current_user).channels_user
           end

           def destroy
             Channel.find(params[:id]).destroy
               @cu = ChannelsUser.all
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