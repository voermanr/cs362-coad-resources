require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
  context 'as a signed in user' do
    let(:a_signed_in_user) { create(:user) }
    before(:each) { sign_in(a_signed_in_user) }

    describe '#GET #index' do
      it { expect(get(:index)).to redirect_to dashboard_path }
    end

    describe 'GET #show' do
      it { expect(get(:show, params: { id: attributes_for(:resource_category) })).to redirect_to dashboard_path }
    end

    describe 'GET #new' do
      it { expect(get(:show, params: { id: attributes_for(:resource_category) })).to redirect_to dashboard_path }
    end

    describe 'POST #create' do
      it { expect(post(:create, params: { id: attributes_for(:resource_category) })).to redirect_to dashboard_path }
    end

    describe 'GET #edit' do
      it { expect(get(:edit, params: { id: attributes_for(:resource_category) })).to redirect_to dashboard_path }
    end

    describe 'PUT #update' do
      it { expect(put(:update, params: { id: attributes_for(:resource_category) })).to redirect_to dashboard_path }
    end

    describe 'PATCH #activate' do
      it { expect(patch(:activate, params: { id: attributes_for(:resource_category) })).to redirect_to dashboard_path }
    end

    describe 'PATCH #deactivate' do
      it { expect(patch(:deactivate, params: { id: attributes_for(:resource_category) })).to redirect_to dashboard_path }
    end

    describe 'DELETE #destroy' do
      it { expect(delete(:destroy, params: { id: attributes_for(:resource_category) })).to redirect_to dashboard_path }
    end
  end

  context 'as a logged out user' do
    let(:a_logged_out_user) { create(:user) }

    describe '#GET #index' do
      it { expect(get(:index)).to redirect_to new_user_session_path }
    end

    describe 'GET #show' do
      it { expect(get(:show, params: { id: attributes_for(:resource_category) })).to redirect_to new_user_session_path }
    end

    describe 'GET #new' do
      it { expect(get(:show, params: { id: attributes_for(:resource_category) })).to redirect_to new_user_session_path }
    end

    describe 'POST #create' do
      it { expect(post(:create, params: { id: attributes_for(:resource_category) })).to redirect_to new_user_session_path }
    end

    describe 'GET #edit' do
      it { expect(get(:edit, params: { id: attributes_for(:resource_category) })).to redirect_to new_user_session_path }
    end

    describe 'PUT #update' do
      it { expect(put(:update, params: { id: attributes_for(:resource_category) })).to redirect_to new_user_session_path }
    end

    describe 'PATCH #activate' do
      it { expect(patch(:activate, params: { id: attributes_for(:resource_category) })).to redirect_to new_user_session_path }
    end

    describe 'PATCH #deactivate' do
      it { expect(patch(:deactivate, params: { id: attributes_for(:resource_category) })).to redirect_to new_user_session_path }
    end

    describe 'DELETE #destroy' do
      it { expect(delete(:destroy, params: { id: attributes_for(:resource_category) })).to redirect_to new_user_session_path }
    end
  end

  context 'as an admin user' do
    let(:a_logged_out_user) { create(:user, :admin) }
    before(:each) { sign_in(a_logged_out_user) }

    describe '#GET #index' do
      it { expect(get(:index)).to be_successful }
    end

    describe 'GET #show' do
      it { expect(get(:show, params: { id: create(:resource_category) })).to be_successful }
    end

    describe 'GET #new' do
      it { expect(get(:new)).to be_successful }
    end

    describe 'POST #create' do
      it { expect(post(:create, params: { resource_category: attributes_for(:resource_category) })).to redirect_to resource_categories_path }

      it 'a bad resource category' do
        expect_any_instance_of(ResourceCategory).to receive(:save).and_return(false)
        expect(post(:create, params: { resource_category: attributes_for(:resource_category)})).to be_successful
      end

    end

    describe 'GET #edit' do
      it { expect(get(:edit, params: { id: create(:resource_category) })).to be_successful }
    end

    describe 'PUT #update' do
      it { expect(put(:update, params: { id: create(:resource_category), resource_category: attributes_for(:resource_category) })).to redirect_to resource_category_path }

      # it 'a bad resource category' do
      #   expect_any_instance_of(ResourceCategory).to receive(:update).and_return(false)
      #   expect(put(:update, params: { id: create(:resource_category), resource_category: attributes_for(:resource_category)})).to be_successful
      # end
    end

    describe 'PATCH #activate' do
      it { expect(patch(:activate, params: { id: create(:resource_category) })).to redirect_to resource_category_path }

      it 'a bad resource category' do
        expect_any_instance_of(ResourceCategory).to receive(:activate).and_return(false)
        expect(patch(:activate, params: { id: create(:resource_category), resource_category: attributes_for(:resource_category)})).to redirect_to(resource_category_path)
      end
    end

    describe 'PATCH #deactivate' do
      it { expect(patch(:deactivate, params: { id: create(:resource_category) })).to redirect_to resource_category_path }

      it 'a bad resource category' do
        expect_any_instance_of(ResourceCategory).to receive(:deactivate).and_return(false)
        expect(patch(:deactivate, params: { id: create(:resource_category), resource_category: attributes_for(:resource_category)})).to redirect_to(resource_category_path)
      end
    end

    describe 'DELETE #destroy' do
      it { expect(delete(:destroy, params: { id: create(:resource_category) })).to redirect_to resource_categories_url }
    end
  end
end
