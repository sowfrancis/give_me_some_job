require 'rails_helper'

RSpec.describe JobsController, type: :controller do

	describe "all jobs" do
		render_views

		it "return all job" do
			job
			get :index
			expect(assigns(:jobs)).to eq ([job])
		end

		it "create a job" do
			@recruiter = Fabricate(:recruiter)
			sign_in @recruiter
			post :create, job: Fabricate.attributes_for(:job)
			expect(Job.count).to eq 1
		end

		it "show a job" do
			get :show, id: job
			expect(job).to render_template :show
		end

		it "should update a job" do
			@attr = {name: "ballafré"}
			put :update, id: job, job: @attr
			job.reload
			expect(job.name).to eq "ballafré"
		end

		context "recruiter message" do
			it "displays recruiter image" do
				get :show, id: job
				expect(response.body).to include recruiter.recruiterimg.url
			end

			let!(:message) {Fabricate(:message, content: "Salut", recruiter: recruiter, job: job )}
		end

		context "user message" do
			it "displays user image" do
				get :show, id: job
				expect(response.body).to include user.userimg.url
			end

			let!(:message) {Fabricate(:message, content: "Salut", user: user, job: job )}
		end

		let(:user) {Fabricate(:user)}
		let(:recruiter) {Fabricate(:recruiter)}
		let(:job) {Fabricate(:job)}
	end
end
