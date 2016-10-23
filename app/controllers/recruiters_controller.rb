class RecruitersController < ApplicationController

	before_action :authenticate_user!

	def show 
		@recruiter = Recruiter.find(params[:id])
		@jobs = @recruiter.jobs.order(created_at: :desc)
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
