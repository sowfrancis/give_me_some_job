class TagsController < ApplicationController

	def new
		@tag = Job.tags.new
	end

	def create
		@tag = Job.tags.new(tag_params)
		@tag.save
	end

	def index
		@jobs = Job.all
		if params[:tag]
			@jobs = Job.name_tag(params[:tag])
		else
			@jobs = Job.all.order('created_at DESC')
		end
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end
end
