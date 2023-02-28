require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    context 'as a non admin but signed in user' do
        let(:a_signed_in_user) { create(:user) }
        before(:each) do
            sign_in(a_signed_in_user)
        end

        describe 'GET #new' do
            it { expect(get(:new)).to be_successful}
        end

        describe 'POST #create' do
            it { expect(post(:create, params: { ticket: attributes_for(:ticket) })).to redirect_to ticket_submitted_path }

            # it 'a bad ticket' do
            #     expect_any_instance_of(Ticket).to receive(:save).and_return(false)
            #     expect(post(:create, params: { Ticket: attributes_for(:Ticket)})).to be_successful
            # end
        end

        describe 'GET #show' do
            it { expect(get(:show, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }
        end

        describe 'POST #capture' do
            it { expect(post(:capture, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }
        end
    end
end
