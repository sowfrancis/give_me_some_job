class TagsController < ApplicationController

	def new
		@tag = Job.tags.new
	end

	def create
		@tag = Job.tags.new(tag_params)
		@tag.save
	end

	def index
		@tags = Tag.all
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end
end
