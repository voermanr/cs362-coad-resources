require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
    
    context 'as a non admin but signed in user:' do 
        let(:a_signed_in_user) { create(:user) }
        before(:each) do
            sign_in(a_signed_in_user)
        end
    
        describe 'GET #new' do
            it { expect(get(:new)).to be_successful}
        end

        describe 'POST #create' do
            it { expect(post(:create, params: { ticket: attributes_for(:ticket) })).to redirect_to ticket_submitted_path }
        end

        describe 'GET #show' do
            it { expect(get(:show, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }
        end

        describe 'POST #capture' do
            it { expect(post(:capture, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }
        end

        describe 'POST #release' do
            it { expect(post(:release, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }        
        end

        describe 'PATCH #close' do
            it { expect(patch(:release, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }        
        end

        describe 'DELETE #destroy' do
            it { expect(delete(:release, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }
        end
    end

    context 'as a user with an unapproved organization:' do
        let(:current_user) { create(:user, :organization_unapproved) }
        before(:each) do
            sign_in(current_user)
        end

        describe 'user\'s organization is unapproved' do
            it { expect(current_user&.organization&.approved?).to be_falsey }
        end

        describe 'GET #show' do
            it { expect(get(:show, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }
        end

        describe 'POST #capture' do
            it { expect(post(:capture, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }
        end

        describe 'POST #release' do
            it { expect(post(:release, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }        
        end

        describe 'PATCH #close' do
            it { expect(patch(:close, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }        
        end

        describe 'DELETE #destroy' do
            it { expect(delete(:destroy, params: { id: attributes_for(:ticket) })).to redirect_to dashboard_path }
        end
    end

    context 'as a user with an approved organization:' do
        let(:current_user) { create(:user, :organization_approved) }
        let(:ticket) {create(:ticket) }
        before(:each) do
            sign_in(current_user)
        end

        describe 'user\'s organization is approved' do
            it { expect(current_user&.organization&.approved?).to be_truthy }
        end

        describe 'user is admin' do
            it { expect(current_user&.admin?).to be_falsey }
        end

        describe 'GET #show' do 
            it { expect(get(:show, params: { id: ticket.id })).to be_successful }
        end

        describe 'POST #capture' do
            it { expect(post(:capture, params: { id: ticket.id })).to redirect_to dashboard_path << '#tickets:open' }
        end

        describe 'POST #release' do
            it { expect(post(:release, params: { id: ticket.id })).to be_successful}
        end


    end

context 'as an admin user with an approved organization:' do
        let(:current_user) { create(:user, :organization_approved, :admin) }
        let(:ticket) {create(:ticket) }
        before(:each) do
            sign_in(current_user)
        end

        describe 'user is an admin' do
            it {expect(current_user.admin?).to be_truthy }
        end

        describe 'POST #release' do
            it { expect(post(:release, params: { id: ticket.id })).to redirect_to dashboard_path << '#tickets:captured' }
        end
    end
end
