require 'rails_helper'

RSpec.describe Candidacy, type: :model do


  describe "candidacy errors" do

    let(:user) {Fabricate(:user)}
    let(:job) {Fabricate(:job)}
    let!(:candidacy) {Fabricate(:candidacy, user_id: user.id, job_id: job.id)}
    let(:candidacy1) {Fabricate.build(:candidacy, user_id: user.id, job_id: job.id)}

    it "should be valid" do
      expect(candidacy).to be_valid
    end

    it "should not be valid if a candidacy already exist" do
      expect(candidacy1.save).to eq false
    end

  end
end