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


  describe 'associations' do
    it { should have_and_belong_to_many(:organizations) }
    it { should have_many(:tickets) }
  end

  describe '.inactive?' do
    let(:res) { build(:resource_category, active: true) }

    it { expect(res.inactive?).to be(false) }
  end

  describe '.activate' do
    let(:res) { build(:resource_category, active: false) }

    it 'calls .activate and expects active to be true' do
      res.activate
      expect(res.inactive?).to be(false)
    end
  end

  describe '.deactivate' do
    let(:res) { build(:resource_category, active: true) }

    it 'calls .activate and expects active to be true' do
      res.deactivate
      expect(res.inactive?).to be(true)
    end
  end

  describe '.to_s' do
    let(:res) { build(:resource_category, name: 'Sheep') }

    it { expect(res.to_s).to eq('Sheep') }
  end

  describe '.unspecified' do
    unspecified_res = ResourceCategory.unspecified

    it { expect(unspecified_res.to_s).to eq('Unspecified') }
  end
end
