require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  describe '#dashboard_for' do
    let(:admin) { create(:user, :admin) }
    let(:organization) { create(:organization) }
    let(:user_without_organization) { create(:user) }
    let(:user) {create(:user) }

    it 'returns "admin_dashboard" for an admin user' do
      expect(helper.dashboard_for(admin)).to eq('admin_dashboard')
    end

    it 'returns "create_application_dashboard" for a user without an organization' do
      expect(helper.dashboard_for(user_without_organization)).to eq('create_application_dashboard')
    end

    it 'returns "organization_submitted_dashboard" for a user with a submitted organization' do
      organization.update(status: :submitted)
      user_without_organization.organization = organization

      expect(helper.dashboard_for(user_without_organization)).to eq('organization_submitted_dashboard')
    end

    it 'returns "organization_approved_dashboard" for a user with an approved organization' do
      organization.update(status: :approved)
      user.organization = organization

      expect(helper.dashboard_for(user)).to eq('organization_approved_dashboard')
    end
  end
end

