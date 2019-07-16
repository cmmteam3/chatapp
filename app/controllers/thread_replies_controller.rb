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
end
