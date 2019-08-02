    class UsersWorkspaceController < ApplicationController

     def index  
       @users = User.where.not(id: current_user)
       @workspace=Workspace.find_by_id(session[:current_workspace])
       @channels=Channel.where(:workspace_id => @workspace.id)
       @usersworkspace=UsersWorkspace.all
       @works = User.all.find_by(id: current_user).users_workspace
       @cu = ChannelsUser.all
       @channelsuser=User.all.find_by(id: current_user).channels_user
     end

     def update  
       @invite_user = User.find(params[:id])
       @invite_workspace = Workspace.find(params[:workspace_id])
       @is_invite =UsersWorkspace.find_by(user: @invite_user, workspace:@invite_workspace, role: "member")
       @is_uninvite = UsersWorkspace.find_by(user: @invite_user, workspace:@invite_workspace, role: "")
       if @is_invite.nil? && @is_uninvite.nil?
        @curr_invite = UsersWorkspace.new(:user => @invite_user, :workspace =>@invite_workspace, :role => "member")
        if @curr_invite.save
          redirect_to :action => 'index'
        end
     end

     if !@is_invite.nil?
        @is_invite.update_attribute(:role, "")
        redirect_to :action => 'index'
     end

     if !@is_uninvite.nil?
        @is_uninvite.update_attribute(:role, "member")
        redirect_to :action => 'index'
     end
    end
  end
