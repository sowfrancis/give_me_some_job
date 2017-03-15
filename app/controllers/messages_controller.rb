class MessagesController < ApplicationController

	def create
		sender = current_recruiter || current_user
		if sender.present? == false
			redirect_to jobs_path, notice: "Vous devez être connecter pour envoyer un message!"
		else
			@message = sender.messages.new(message_params)
			if @message.save
				redirect_to job_path(@message.job_id)
			else
				redirect_to job_path(@message.job_id), notice: "Votre message n'a pas été envoyé, réessayer!"
			end
		end
	end

	private

	def message_params
		params.require(:message).permit(:content, :job_id, :recruiter_id, :user_id)
	end
end