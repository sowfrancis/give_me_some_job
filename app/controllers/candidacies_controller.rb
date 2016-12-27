class CandidaciesController < ApplicationController


	def create
		@job = Job.find(params[:candidacy][:job_id])
		@recruiter = @job.recruiter
		@candidat = Candidacy.new(job_id: @job , user_id: current_user.id)
		CandidacyMailer.candidacy_email(@recruiter, current_user).deliver_now
		redirect_to job_path(@job), notice: "T'as candidature a bien été envoyée!"
	end

	private

	def params_candidacy
		params.require(:candidacy).permit(:job_id)
	end

end