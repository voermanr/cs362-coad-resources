# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'create a dashboard' do
    it { expect(Dashboard).to be }
  end

  context 'as a signed in user' do
    let(:a_signed_in_user) { create(:user) }
    before(:each) { sign_in(a_signed_in_user) }

    describe 'GET #index' do
      it { expect(get(:index)).to be_successful }
    end
  end
end
