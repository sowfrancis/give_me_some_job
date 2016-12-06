class SearchsController < ApplicationController

	def index
		@q = params[:q]
		@jobs_tag = Job.name_tag(@q) #all job near position
		@jobs_place = Job.in_place_named(@q) #job with tag
	end
end
