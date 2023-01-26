require 'rails_helper'

RSpec.describe Organization, type: :model do
  let (:org) {Organization.new}
  it "responds to agreement attributes" do
    expect(org).to respond_to(:agreement_one, :agreement_two, :agreement_three, :agreement_four, :agreement_five, :agreement_six, :agreement_seven, :agreement_eight)
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

  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_length_of(:email)}
  end
end
