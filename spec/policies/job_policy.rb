require 'rails_helper'

RSpec.describe JobPolicy do

  describe JobPolicy do
    subject { JobPolicy }
    let!(:job) {Fabricate(:job)}
    let!(:recruiter) {Fabricate(:recruiter, id: nil)}
    let!(:recruiter1) {Fabricate(:recruiter)}
    let!(:job1) {Fabricate(:job, recruiter: recruiter1)}


    permissions :update?, :edit? do
      it "denies access if is not the job's recruiter" do
        expect(subject).not_to permit(recruiter, job)
      end

      it "grants access if recruiter is job's recruiter" do
        expect(subject).to permit(recruiter1, job1)
      end
    end
  end
end