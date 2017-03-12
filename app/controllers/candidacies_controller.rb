class CandidaciesController < ApplicationController

	def create
		@job = Job.find(params[:candidacy][:job_id])
		@recruiter = @job.recruiter
		@candidacy = SendCandidacy.new(@job, current_user)
		@candidacy.send_new_candidacy
		redirect_to user_path(current_user)
	end

	def create_multiple
		tag = Tag.find_by(name: params[:tag_name])
		if tag.present?
			tag.jobs.each do |job|
				@send_candidacy_service = SendCandidacy.new(job, current_user)
				@candidacy = @send_candidacy_service.send_new_candidacy
				if @candidacy.valid?
					flash[:notice] = "vos candidatures multiples ont bien été envoyer!"
				else
					flash[:notice] = "vos candidatures multiples n'ont pas été envoyer,
														veuillez rééssayer plus tard!"
				end
			end
			else
				flash[:notice] = "Il n'y a pas de job dans ce domaine. #{tag}"
		end
		redirect_to user_path(current_user)
	end

	private

	def params_candidacy
		params.require(:candidacy).permit(:job_id)
	end

end
