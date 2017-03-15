require 'rails_helper'

RSpec.describe UserPolicy do

  describe UserPolicy do
    subject { UserPolicy }
    let!(:user) {Fabricate(:user)}
    let!(:user1) {Fabricate(:user, id: nil)}

    permissions :update?, :edit? do
      it "denies access if is not the job's recruiter" do
        expect(subject).not_to permit(user1)
      end

      it "grants access if recruiter is job's recruiter" do
        expect(subject).to permit(user, user)
      end
    end
  end
end