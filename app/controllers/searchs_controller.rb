class SearchsController < ApplicationController

	def index
		@q = params[:q]
		@jobs_tag = Job.name_tag(@q)
		@jobs_place = Job.in_place_named(@q)
	end
end
