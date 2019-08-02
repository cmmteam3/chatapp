    class ChannelsUserController < ApplicationController

    	def index
       @usersworkspace=UsersWorkspace.all
       @workspace=Workspace.find_by_id(session[:current_workspace])
       @channels=Channel.where(:workspace_id => @workspace.id)
       @usersworkspace=UsersWorkspace.where.not(user_id: current_user.id)
       @cu = ChannelsUser.all
       @works = User.all.find_by(id: current_user).users_workspace
       #@channelsuser=User.all.find_by(id: current_user).channels_user
     end

     def update
       @invite_user = UsersWorkspace.find(params[:id])
       @invite_channel = Channel.find(params[:channel_id])
       @is_invite =ChannelsUser.find_by(user: @invite_user, channel: @invite_channel, role: "member")
       @is_uninvite = ChannelsUser.find_by(user: @invite_user, channel: @invite_channel, role: "")
       if @is_invite.nil? && @is_uninvite.nil?
        @curr_invite = ChannelsUser.new(user_id: @invite_user.id,channel_id: @invite_channel.id, :role => "member")
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
