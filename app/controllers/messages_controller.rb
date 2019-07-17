class MessagesController < ApplicationController
	def create
		@message=Message.new(name:params[:name],channel_id:params[:channel_id],user_id:current_user.id)
		@message.save
	    flash[:success] = "Message create is scuccess."
	    @channel= Channel.find(params[:channel_id])
        redirect_to channel_path(@channel)
        
	end
	def destroy
		Message.find(params[:id]).destroy
		 flash[:success] = "Message destroy is scuccess."
	   @channel=Channel.find(   session[:channels_list])
       redirect_to channel_path(@channel)

	end
	def edit
		 @currentWorkspace=Workspace.find_by_id(session[:current_workspace])
		 @messages = Message.find(params[:id])
	end
	def update
		   @message= Message.find(params[:id])
            @message.update(name:params[:name])
            @message.save
             flash[:success] = "Message update is scuccess."
            @channel=Channel.find(   session[:channels_list])
           redirect_to channel_path(@channel)
	end

end
