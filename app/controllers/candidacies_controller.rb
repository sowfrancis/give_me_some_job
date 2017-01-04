class CandidaciesController < ApplicationController


	def create
		@job = Job.find(params[:candidacy][:job_id])
		@recruiter = @job.recruiter
		@candidat = Candidacy.new(job_id: @job.id , user_id: current_user.id)
		if @candidat.save
			CandidacyMailer.candidacy_email(@recruiter, current_user).deliver_now
			redirect_to job_path(@job), notice: "T'as candidature a bien été envoyée!"
		else
			render 'new'
		end
	end

	def create_multiple
		tag = Tag.find_by(name: params[:tag_name])
		@job = tag.jobs.first
		@candidacy = Candidacy.create(job_id: @job.id, user_id: current_user.id)
		redirect_to user_path(current_user)
	end

	private

	def params_candidacy
		params.require(:candidacy).permit(:job_id)
	end

end
