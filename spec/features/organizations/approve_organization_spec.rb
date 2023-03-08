require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

    it 'can be done from the dashboard' do
        user = create(:user, :admin)
        organization = create(:organization)
        log_in_as(user)

        visit dashboard_path

        click_on 'Organizations'
        click_on 'Pending'
        click_on 'Review'
        click_on 'Approve'

        expect(organization.reload.approved?).to be true
    end


    it 'cannot be done by a non-admin user' do
        organization = create(:organization, :approved, name: "org1")
        not_approved_organization = create(:organization, name: "org2")
        user = create(:user, organization: organization)

        log_in_as(user)

        visit dashboard_path


        expect(page).to_not have_content 'Organization Applications'
        visit organization_path(id: not_approved_organization.id)
        expect(page).not_to have_content 'Approve'

    end
end
