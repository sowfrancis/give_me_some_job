require 'rails_helper'

RSpec.describe CandidaciesController, type: :controller do

	describe "candidacies" do

		it "create candidat" do 
			@user = Fabricate(:user)
			@job = Fabricate(:job)
			sign_in @user
			post :create, candidacy: Fabricate.attributes_for(:candidacy, job_id: @job, user_id: @user)
			expect(Candidacy.first.user_id).to eq @user.id
			expect(Candidacy.first.job_id).to eq @job.id
		end
	end

end
