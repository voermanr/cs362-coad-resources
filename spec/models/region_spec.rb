require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) {Region.new}
  
  it "responds to attribute name" do
    expect(region).to respond_to(:name)
  end

  it "responds to has_many attribute tickets" do
    expect(region).to respond_to(:tickets)
  end

  it "has a string representation that is its name" do
    name = 'Mt. Hood'
    region = Region.new(name: name)
    result = region.to_s
  end

  describe 'associations' do
    it { should have_many(:tickets) }
  end

  describe 'to_s testing' do
    let(:reg) { build(:region, name: 'The Twilight Zone') }

    it { expect(reg.to_s).to eq('The Twilight Zone') }
  end

  describe 'unspecified testing' do
    unspecified_region = Region.unspecified

    it { expect(unspecified_region.to_s).to eq('Unspecified') }
  end
end
