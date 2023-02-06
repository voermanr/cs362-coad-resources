require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) {create(:ticket)}

  it "responds to belongs_to attributes" do
    expect(ticket).to respond_to(:region, :resource_category, :organization)
  end

  it "responds to validates attributes" do
    expect(ticket).to respond_to(:name, :phone, :region_id, :resource_category_id, :description)
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:region_id)}
    it {should validate_presence_of(:resource_category_id)}

    it {should validate_length_of(:name).is_at_least(1)}
    it {should validate_length_of(:name).is_at_most(255)}
    it {should validate_length_of(:description).is_at_most(1020)}

    it {should allow_value("+1-555-555-1212").for(:phone)}
    it {should_not allow_value("dfghjifuygh").for(:phone)}

  end

  describe 'scope' do
    let(:openticket) {create(:ticket, name: 'Test Open', closed: false)}
    let(:closedticket) {create(:ticket, name: 'Test Closed', closed: true )}
    it "includes tickets with open/close flag" do
      expect(Ticket.open).to include(openticket)
    end
    it 'wasdter' do
      pp Ticket.closed
      expect(Ticket.closed).to include(closedticket)
    end

  end

  describe 'associations' do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization).optional }
  end

  describe '.open?' do
    let(:tic) { build(:ticket, closed: true) }

    it { expect(tic.open?).to be(false) }
  end

  describe '.captured?' do
    let(:org) { build(:organization) }
    let(:tic) { build(:ticket, organization: org) }

    it { expect(tic.captured?).to be true }
  end

  describe '.to_s' do
    let(:tic) { build(:ticket, id: 12_345) }

    it { expect(tic.to_s).to eq('Ticket 12345') }
  end

end
