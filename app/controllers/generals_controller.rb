class GeneralsController < ApplicationController
	def create
		@message=Message.new(name:params[:name],channel_id:params[:channel_id],user_id:current_user.id)
		@message.save
	end
end
