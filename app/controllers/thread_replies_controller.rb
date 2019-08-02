	class ThreadRepliesController < ApplicationController

		def show
		end

		def create
			@thread=ThreadReply.new(text:params[:text],channel_id:params[:channel_id],message_id:params[:message_id],user_id:current_user.id)
			@thread.save
			@channel= Channel.find(params[:channel_id])
			@message= Message.find(params[:message_id])
			redirect_to channel_path(@channel)
		end

		def destroy
			ThreadReply.find(params[:id]).destroy
			flash[:notice] =t(:"Thread destroy successful")
			@channel=Channel.find(session[:channels_list])
			redirect_to channel_path(@channel)			
		end

		def edit
			@currentWorkspace=Workspace.find_by_id(session[:current_workspace])
			@threads = ThreadReply.find(params[:id])
		end
		
		def update
			@thread= ThreadReply.find(params[:id])
			@thread.update(text:params[:text])
			@thread.save
			flash[:success] =t(:"Thread update successful") 
			@channel=Channel.find(session[:channels_list])
			redirect_to channel_path(@channel)
		end
	end
