class RecruitersController < ApplicationController

	before_action :authenticate_recruiter!

	def show
		@recruiter = Recruiter.find(params[:id])
		@jobs = @recruiter.jobs.order(created_at: :desc)
		stock_jobs = nil
		@stock_candidate = nil
		@jobs_candidate = @jobs.map { |job|  stock_jobs = Candidacy.all.select{|candidacy| candidacy.job_id == job.id}}
		if @jobs_candidate.present?
			@candidates = stock_jobs.map {|candidate| @stock_candidate = User.all.select { |user| user.id == candidate.user_id }}
		end
	end

	def edit
		@recruiter = Recruiter.find(params[:id])
	end

	def update
		@recruiter = Recruiter.find(params[:id])
		if @recruiter.update_attributes(params_recruiter)
			redirect_to recruiter_path(@recruiter)
		else
			render "edit"
		end
	end

	private

	def params_recruiter
		params.require(:recruiter).permit(:name, :recruiterimg, :description, :about_us)
	end
end
