require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.new}

  it "responds to attribute email" do
    expect(user).to respond_to(:email)
  end

  it "responds to attribute role" do
    expect(user).to respond_to(:role)
  end


  describe 'associations' do
    it { should belong_to(:organization).optional }
  end

end
