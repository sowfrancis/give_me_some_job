class MessagesController < ApplicationController

	def index
		@messages = Message.all
	end

	def new
		@messages = Message.all
		@message = Message.new
	end

	def create
		@message = Message.new(message_params) 
		case @message
			when current_recruiter
				@message = current_recruiter.messages.new(message_params)
			when current_user
				@message = current_user.messages.new(message_params)
		end
		if @message.save
			redirect_to job_path(@message.job_id)
		else
			render 'new'
		end
	end

	private

	def message_params
		params.require(:message).permit(:content, :job_id, :recruiter_id, :user_id)
	end
end
