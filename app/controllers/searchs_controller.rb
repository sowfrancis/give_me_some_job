class SearchsController < ApplicationController

	def search 
	  @jobs = Job.search params[:q]
	  @jobs.each do |job|
	  	puts job.name
	  end
	end
end
