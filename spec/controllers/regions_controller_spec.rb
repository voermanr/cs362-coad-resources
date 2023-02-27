require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  context 'as a signed_in user' do
    let(:a_signed_in_user) { create(:user) }
    before(:each) do
      sign_in(a_signed_in_user)
    end

    # Tests start here
    describe 'GET #index' do
      it { expect(get(:index)).to redirect_to dashboard_path }
    end

    describe 'GET #show' do
      it { expect(get(:show, params: { id: attributes_for(:region) })).to redirect_to dashboard_path }
    end

    describe 'GET #new' do
      it { expect(get(:new)).to redirect_to dashboard_path }
    end

    describe 'POST #create' do
      it { expect(post(:create)).to redirect_to dashboard_path }

      # it 'a bad region' do
      #   expect_any_instance_of(Region).to receive(:save).and_return(false)
      #   expect(post(:create, params: { id: attributes_for(:region)})).to be_successful
      # end

    end

    describe 'GET #edit' do
      it { expect(get(:edit, params: { id: attributes_for(:region) })).to redirect_to dashboard_path }
    end

    describe 'PUT #update' do
      it { expect(put(:update, params: { id: attributes_for(:region) })).to redirect_to dashboard_path }
    end

    describe 'DELETE #destroy' do
      it { expect(delete(:destroy, params: { id: create(:region) })).to redirect_to dashboard_path }
    end
  end

  context 'as a logged out user' do
    let(:a_signed_out_user) { create(:user) }

    # Tests start here
    describe 'GET #index' do
      it { expect(get(:index)).to redirect_to new_user_session_path }
    end

    describe 'GET #show' do
      it { expect(get(:show, params: { id: attributes_for(:region) })).to redirect_to new_user_session_path }
    end

    describe 'GET #new' do
      it { expect(get(:new)).to redirect_to new_user_session_path }
    end

    describe 'POST #create' do
      it { expect(post(:create)).to redirect_to new_user_session_path }
    end

    describe 'GET #edit' do
      it { expect(get(:edit, params: { id: attributes_for(:region) })).to redirect_to new_user_session_path }
    end

    describe 'PUT #update' do
      it { expect(put(:update, params: { id: attributes_for(:region) })).to redirect_to new_user_session_path }
    end

    describe 'DELETE #destroy' do
      it { expect(delete(:destroy, params: { id: attributes_for(:region) })).to redirect_to new_user_session_path }
    end
  end

  context 'as an admin user' do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }

    # Tests start here
    describe 'GET #index' do
      it { expect(get(:index)).to be_successful }
    end

    describe 'GET #show' do
      it { expect(get(:show, params: { id: create(:region) })).to be_successful }
    end

    describe 'GET #new' do
      it { expect(get(:new)).to be_successful }
    end

    describe 'POST #create' do
      it { expect(post(:create, params: { region: attributes_for(:region) })).to redirect_to regions_path }
    end

    describe 'GET #edit' do
      it { expect(get(:edit, params: { id: create(:region) })).to be_successful }
    end

    describe 'PUT #update' do
      it { expect(put(:update, params: { id: create(:region), region: attributes_for(:region) })).to redirect_to region_path }
    end

    describe 'DELETE #destroy' do
      it { expect(delete(:destroy, params: { id: create(:region) })).to redirect_to regions_path }
    end
  end
end
