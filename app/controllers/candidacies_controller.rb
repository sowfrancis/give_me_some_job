class CandidaciesController < ApplicationController


	def create
		@job = Job.find(params[:candidacy][:job_id])
		@candidat = Candidacy.new(job_id: @job , user_id: current_user.id)
		redirect_to job_path(@job), notice: "on a bien reçu votre candidature!"
	end

	private

	def params_candidacy
		params.require(:candidacy).permit(:job_id)
	end

end
