require 'rails_helper'

RSpec.describe SendCandidacy do

  describe "send and create candidacy" do

    before do
      send_candidacy_service = SendCandidacy.new(job, user)
      send_candidacy_service.send_new_candidacy
    end

    let!(:job)  {Fabricate(:job)}
    let!(:user) {Fabricate(:user)}

    it "create a candidacy" do
      expect(Candidacy.count).to eq 1
      expect(Candidacy.first.user_id).to eq user.id
      expect(Candidacy.first.job_id).to eq job.id
    end
  end
end