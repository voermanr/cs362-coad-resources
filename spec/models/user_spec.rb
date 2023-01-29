require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.new}

  it "responds to attribute email" do
    expect(user).to respond_to(:email)
  end

  it "responds to attribute role" do
    expect(user).to respond_to(:role)
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it { should validate_length_of(:email).is_at_least(1) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_length_of(:password).is_at_least(7) }
    it { should validate_length_of(:password).is_at_most(255) }

    it {should allow_value("user@example.com").for(:email)}

    it {should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'associations' do
    it { should belong_to(:organization).optional }
  end


  describe 'set_default_role testing' do
    let(:user) { build(:user) }

    it { expect(user.role).to eq("organization") }
  end


  describe "to_s method testing" do
    let(:user) { build(:user, email: 'example@sixflags.com') }

    it 'returns email' do
      expect(user.to_s).to eq 'example@sixflags.com'
    end
  end
end
