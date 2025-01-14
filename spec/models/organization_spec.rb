require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:org) { build(:organization) }

  it "responds to agreement attributes" do
    expect(org).to respond_to(:agreement_one, :agreement_two, :agreement_three, :agreement_four, :agreement_five,
                              :agreement_six, :agreement_seven, :agreement_eight)
  end

  it "responds to presence_of attributes" do
    expect(org).to respond_to(:email, :name, :phone, :status, :secondary_phone, :primary_name, :secondary_name)
  end

  it "responds to length_of attributes" do
    expect(org).to respond_to(:description)
  end

  it "responds to after_initialize attributes" do
  expect(org).to respond_to(:set_default_status)
  end

  it "responds to has_many attributes" do
    expect(org).to respond_to(:users, :tickets)
  end

  it "responds to has_and_belongs_to_many attributes" do
    expect(org).to respond_to(:resource_categories)
  end

  # Validation Tests

  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:primary_name)}
    it {should validate_presence_of(:secondary_name)}
    it {should validate_presence_of(:secondary_phone)}

    it {should validate_length_of(:email).is_at_most(255)}
    it {should validate_length_of(:email).is_at_least(1)}
    it {should validate_length_of(:name).is_at_most(255)}
    it {should validate_length_of(:email).is_at_least(1)}
    it {should validate_length_of(:description).is_at_most(1020)}

    it {should allow_value("user@example.com").for(:email)}

    it {should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it {should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end


  describe 'associations' do
    it { should have_many(:users) }
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:resource_categories)}
  end


  describe 'approve testing' do
    let(:org) { build(:organization) }

    it 'calls approve then expects the status to be approved' do
      org.approve
      expect(org.status).to eq("approved")
    end
  end

  describe 'reject testing' do
    let(:org) { build(:organization) }

    it 'calls approve then expects the status to be approved' do
      org.reject
      expect(org.status).to eq("rejected")
    end
  end

  describe 'set_default_status testing' do
    let(:org) { build(:organization) }

    it { expect(org.status).to eq("submitted") }
  end

  describe 'to_s testing' do
    let(:org) { build(:organization, name: "Chuck E Cheeses") }

    it { expect(org.to_s).to eq("Chuck E Cheeses") }
  end

end
