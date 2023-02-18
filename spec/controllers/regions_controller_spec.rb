require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  message_dashboard_redirect = 'expects to get redirected to the dashboard'

  context 'as a signed_in user' do
    let(:a_signed_in_user) { create(:user) }
    before(:each) do
      sign_in(a_signed_in_user)
    end

    describe 'GET #index' do
      it { expect(get(:index)).to redirect_to dashboard_path }
    end

    describe 'GET #show' do
      it message_dashboard_redirect do
        expect(get(:show, params: { id: attributes_for(:region) })).to redirect_to dashboard_path
      end
    end

    describe 'GET #new' do
      it do
        expect(get(:new)).to redirect_to dashboard_path
      end
    end
  end

  context 'as a logged out user' do
    let(:a_signed_out_user) { create(:user) }

    describe 'GET #index' do
      it message_dashboard_redirect do
        expect(get(:index)).to redirect_to new_user_session_path
      end
    end
  end

  context 'as an admin user' do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }

    describe 'GET #index' do
      it { expect(get(:index)).to be_successful }
    end

    describe 'GET #create' do
      it do
        post(:create, params: { region: attributes_for(:region) })
        expect(response).to redirect_to regions_path
      end
    end
  end
end