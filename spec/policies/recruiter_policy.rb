require 'rails_helper'

RSpec.describe RecruiterPolicy do

  describe RecruiterPolicy do
    subject { RecruiterPolicy }
    let!(:recruiter) {Fabricate(:recruiter)}
    let!(:recruiter1) {Fabricate(:recruiter, id: nil)}

    permissions :update?, :edit? do
      it "denies access if is not the job's recruiter" do
        expect(subject).not_to permit(recruiter1)
      end

      it "grants access if recruiter is job's recruiter" do
        expect(subject).to permit(recruiter, recruiter)
      end
    end
  end
end