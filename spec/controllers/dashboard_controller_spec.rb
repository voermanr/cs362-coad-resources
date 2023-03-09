require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
    context 'as a signed in user' do
        let(:a_signed_in_user) { create(:user) }
        before(:each) { sign_in(a_signed_in_user) }

        describe 'GET #index' do
          it { expect(get(:index)).to be_successful}
        end
    end
end
