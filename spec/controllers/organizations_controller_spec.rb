require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  context 'as a signed in user' do
    let(:a_signed_in_user) { create(:user) }
    before(:each) { sign_in(a_signed_in_user) }

    describe 'POST #approve' do
      it { expect(post(:approve, params: { id: attributes_for(:organization) })).to redirect_to dashboard_path }
    end

    describe 'POST #reject' do
      it { expect(post(:reject, params: { id: attributes_for(:organization) })).to redirect_to dashboard_path }
    end

    describe 'GET #resources' do
      # TODO: find out what the heck #resources is
      # it { expect(get(:resources, params: { id: attributes_for(:organization) })).to redirect_to dashboard_path }
    end

    describe 'GET #index' do
      it { expect(get(:index)).to be_successful }
    end

    describe 'POST #create' do
      it { expect(post(:create, params: { organization: attributes_for(:organization) })).to be_successful }
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
      it { expect(put(:update, params: { id: attributes_for(:organization) })).to redirect_to dashboard_path }
    end

    describe 'DELETE #destroy' do
      # TODO: Where is my destroy tonight? I hope he is a gentleman
      # it { expect(delete(:destroy, params: { id: attributes_for(:organization) })).to be_successful }
    end
  end
end
