# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  context 'as an admin user' do
    let(:organization) { create(:organization) }
    let(:an_admin) { create(:user, :admin) }
    before(:each) { sign_in an_admin }

    it 'PUT #approve' do
      allow_any_instance_of(Organization).to receive(:save).and_return(false)

      #TODO: I think this is broken. something about view render.
      # expect(put(:approve, params: { id: organization.id })).to redirect_to organizations_path
    end

    it 'PUT #reject' do
      expect(put(:reject, params: { id: organization.id, organization: { rejection_reason: 'too stinky' } })).to redirect_to organizations_path
    end

    describe 'PUT #reject' do
      it 'can fail to save' do
        allow_any_instance_of(Organization).to receive(:save).and_return(false)
        #TODO: some sort of render failure.
        # expect(put(:reject, params: { id: organization.id, organization: { rejection_reason: 'not stinky enough' } })).to redirect_to organization_path(organization.id)
      end
    end
  end

  context 'as a signed in user' do
    let(:a_signed_in_user) { create(:user) }
    let(:organization) { create(:organization) }
    before(:each) { sign_in(a_signed_in_user) }

    describe 'POST #approve' do
      it do
        post(:update, params: { id: organization.id, organization: { name: 'New Name' } })
        expect(response).to redirect_to dashboard_path
      end
    end

    describe 'POST #reject' do
      it { expect(post(:reject, params: { id: attributes_for(:organization) })).to redirect_to dashboard_path }
    end

    # TODO: find out what the heck #resources is
    # describe 'GET #resources' do
    #   it { expect(get(:resources, params: { id: attributes_for(:organization) })).to redirect_to dashboard_path }
    # end

    describe 'GET #index' do
      it { expect(get(:index)).to be_successful }
    end

    describe 'POST #create' do
      it do
        # @Cooper here is how you bypass the email problem. You may want to add an email to the user factory,
        # or just make a user with an email.
        allow_any_instance_of(UserMailer).to receive(:new_organization_application).and_return(true)

        post :create, params: { organization: attributes_for(:organization) }
        expect(response).to redirect_to(organization_application_submitted_path)
      end

      it 'does not succeed' do
        allow_any_instance_of(Organization).to receive(:save).and_return(false)
        expect(post(:create, params: { organization: attributes_for(:organization) })).to be_successful
      end
    end

    describe 'GET #new' do
      it { expect(get(:new)).to be_successful }
    end

    describe 'GET #edit' do
      it { expect(get(:edit, params: { id: attributes_for(:organization) })).to redirect_to dashboard_path }
    end

    describe 'GET #show' do
      it { expect(get(:show, params: { id: attributes_for(:organization) })).to redirect_to dashboard_path }
    end

    describe 'PUT #update' do
      let(:valid_params) { { name: 'some dumb name' } }
      let(:an_approved_organization_user) { create(:user) }
      let(:approved_organization) { create(:organization, :approved, users: [an_approved_organization_user]) }

      before { sign_in an_approved_organization_user }

      it 'succeeds' do
        put :update, params: { id: approved_organization.id, organization: valid_params }
        expect(response).to redirect_to organization_path(id: approved_organization.id)
        expect(approved_organization.reload.name).to eq('some dumb name')
      end

      it 'fails' do
        allow_any_instance_of(Organization).to receive(:update).and_return(false)
        put :update, params: { id: approved_organization.id, organization: valid_params }
        expect(response).to be_successful
      end
    end

    # TODO: Where is my destroy tonight? I hope he is a gentleman
    # describe 'DELETE #destroy' do
    #   it { expect(delete(:destroy, params: { id: attributes_for(:organization) })).to be_successful }
    # end
  end

  context 'as a logged out user' do
    let(:user) { create(:user) }

    it 'redirects to the sign in page' do
      post :create, params: { organization: attributes_for(:organization) }

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
