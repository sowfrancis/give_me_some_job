require 'rails_helper'

RSpec.describe CandidaciesController, type: :controller do

  describe "candidacies" do

    before do
      sign_in user
      post :create, candidacy: Fabricate.attributes_for(:candidacy, job: job, user: user)
    end

    it "create candidat" do
      expect(Candidacy.first.user_id).to eq user.id
      expect(Candidacy.first.job_id).to eq job.id
    end

    let!(:user) {Fabricate(:user)}
    let(:job){Fabricate(:job)}
  end

  describe "send multiple candidacies" do

    before do
      user
      sign_in user
    end

    let!(:tag) {Fabricate(:tag, name: "Démenagement")}
    let!(:job) {Fabricate(:job, tags: [tag])}
    let!(:job1){Fabricate(:job, name:"obamacare", tags: [tag])}

    it "send candidacy by tag" do
      post :create_multiple, tag_name: "Démenagement"
      expect(Candidacy.first.job_id).to eq job.id
      expect(Candidacy.second.job_id).to eq job1.id
    end

    let!(:user) {Fabricate(:user)}
  end
end
