	class MessagesController < ApplicationController
		def create
			@thread=ThreadReply.new
			@message=Message.new(name:params[:name],channel_id:params[:channel_id],user_id:current_user.id)
	#    respond_to do |format|
 #       if @message.save
	#    format.html { redirect_to @message, notice: 'Message was successfully created.' }
 #       format.js
 #       format.json { render json: @message, status: :created, location: @message }
 #       else
 #        format.html { render action: "new" }
 #         format.json { render json: @message.errors, status: :unprocessable_entity }
	#    end
 # end
 @message.save
 flash[:success] = "Message create is scuccess."
 @channel= Channel.find(params[:channel_id])
 redirect_to channel_path(@channel)
 
end
def destroy
	@cu = ChannelsUser.all
	Message.find(params[:id]).destroy
	flash[:notice] = t(:"Message destroy successful")
	@channel=Channel.find(   session[:channels_list])
	redirect_to channel_path(@channel)

end
def edit
	@cu = ChannelsUser.all
	@messages = Message.find(params[:id])
	@workspace=Workspace.find_by_id(session[:current_workspace])
	@channels=Channel.where(:workspace_id => @workspace.id)
	@cu = ChannelsUser.all
	@usersworkspace=UsersWorkspace.all
	@channelsuser=User.all.find_by(id: current_user).channels_user
end
def update
	@cu = ChannelsUser.all
	@message= Message.find(params[:id])
	@message.update(name:params[:name])
	@message.save
	flash[:success] = "Message update is scuccess."
	@channel=Channel.find(   session[:channels_list])
	redirect_to channel_path(@channel)
end
def general
	@aa=Message.new(messageGeneral)
	@aa.save
		# @generalMessage.save
		# redirect_to root_url
	end

	def star
		sms = Message.find(params[:star_id])
		if sms.favourite == false or sms.favourite.nil?
			sms.favourite = "true"
		else
			sms.favourite = "false"
		end
		sms.save     
		redirect_back(fallback_location: root_path)
	end
	def StarShow
		
		@starMessage=Message.all.where(favourite:1,:user =>current_user)
		if @starMessage.empty?
			redirect_back(fallback_location: channels_path)
			flash[:notice] = t(:"No Star List Message")
		else
			@workspace=Workspace.find_by_id(session[:current_workspace])
			@channels=Channel.where(:workspace_id => @workspace.id)
			@usersworkspace=UsersWorkspace.all
			@cu = ChannelsUser.all
			@channelsuser=User.all.find_by(id: current_user).channels_user
		end
	end

	private 
	def messageGeneral
		params.require(:general).permit(:name,:channel_id,user_id:current_user.id)
	end

end
