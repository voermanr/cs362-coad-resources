require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resource_category) {ResourceCategory.new}

  it "responds to attribute name" do
    expect(resource_category).to respond_to(:name)
  end

  it "responds to has_many attribute tickets" do
    expect(resource_category).to respond_to(:tickets)
  end

  it "responds to has_and_belongs_to_many organizations" do
    expect(resource_category).to respond_to(:organizations)
  end

end
