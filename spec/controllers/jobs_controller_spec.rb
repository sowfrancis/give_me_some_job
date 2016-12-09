require 'rails_helper'

RSpec.describe JobsController, type: :controller do
	
	describe "all jobs" do
		
		it "return all job" do
			@job = Fabricate(:job)
			get :index
			expect(assigns(:jobs)).to eq ([@job])
		end

		it "create a job" do
			@recruiter = Fabricate(:recruiter)
			sign_in @recruiter
			post :create, job: Fabricate.attributes_for(:job)
			expect(Job.count).to eq 1
		end

		it "show a job" do
			@job = Fabricate(:job)
			get :show, id: @job
			expect(@job).to render_template :show 
		end

		it "should update a job" do
			@job = Fabricate(:job)
			@attr = {name: "ballafré"}
			put :update, id: @job, job: @attr
			@job.reload
			expect(@job.name).to eq "ballafré"
		end

	end
end
