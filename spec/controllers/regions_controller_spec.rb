require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  # context 'as a logged in user' do
  # let(:user) {create(:user)}
  # before(:each) {sign_in(user)}


  # end
  context 'as an admin' do
    let(:user) {create(:user, :admin)}
    before(:each) {sign_in(user)}

    describe "GET #index" do
      it { expect(get(:index)).to be_successful }
    end

    describe "GET #show" do
      let(:region) { create(:region) }
      it { expect(get(:show, params: { id: region.id } )).to be_successful}
    end

    describe "POST #create" do
      it{
        # r = build(:region)
        post(:create, params: { region: attributes_for(:region) })
        expect(response).to redirect_to(regions_path)
      }
    end

  end
end
