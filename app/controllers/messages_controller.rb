class MessagesController < ApplicationController

	def create
		sender = current_recruiter || current_user
		@message = sender.messages.new(message_params)
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