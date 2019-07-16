class ChannelsUserController < ApplicationController
	def index
       @users = User.where.not(id: current_user)
	end
	def update
        
        @invite_user = User.find(params[:id])
        @invite_channel = Channel.find(params[:channel_id])
        @is_invite =ChannelsUser.find_by(user: @invite_user, channel: @invite_channel, role: "member")
        @is_uninvite = ChannelsUser.find_by(user: @invite_user, channel: @invite_channel, role: "")
        if @is_invite.nil? && @is_uninvite.nil?
            @curr_invite = ChannelsUser.new(:user => @invite_user, :channel => @invite_channel, :role => "member")
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
