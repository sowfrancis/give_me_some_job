class CandidaciesController < ApplicationController

	def index
		stock_jobs = nil
		@stock_candidate = nil
		@jobs_candidate = Job.all.map { |job|  stock_jobs = Candidacy.all.select{|candidacy| candidacy.job_id == job.id}}
		@candidates = stock_jobs.map {|candidate| @stock_candidate = User.all.select { |user| user.id == candidate.user_id }}
	end

	def create
		@job = Job.find(params[:candidacy][:job_id])
		@recruiter = @job.recruiter
		@candidacy_service = SendCandidacy.new(@job, current_user)
		@candidacy = @candidacy_service.send_new_candidacy
		if @candidacy.valid?
			flash[:notice] = "votre candidature est envoyé!"
			redirect_to user_path(current_user)
		else
			render "new"
		end
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
