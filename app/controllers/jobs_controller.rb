class JobsController < ApplicationController

	has_scope :in_place_named
	has_scope :name_tag

	before_action :authenticate_user!, except: [:index, :show]

	def index
		@jobs = Job.all
		if params[:search]
   	  @jobs = Job.search(params[:search]).order('created_at DESC')
  	else
			@jobs = Job.all.order('created_at DESC')
		end
	end

	def create
		@job = current_recruiter.jobs.new(job_params)
		if @job.save
			redirect_to jobs_path
		else
			render "new"
		end
	end

	def new
		@job = Job.new
		@tag = @job.tags.new
	end
	
	def show
		@job = Job.find(params[:id])
	end

	def edit
		@job= Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		if @job.update_attributes(job_params)
			redirect_to job_path(@job)
		else
			render "edit"
		end
	end

	def job_tag
		if params[:tag]
    	@jobs = Job.name_tag(params[:tag])
  	else
    	@jobs = Job.all
  	end
	end

	private

	def job_params
		params.require(:job).permit(:name, :description, :jobimg, :address, :latitude, :longitude, :contact, :tag_list)
	end
end
