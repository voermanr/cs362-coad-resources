require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) {Ticket.new}

  it "responds to belongs_to attributes" do
    expect(ticket).to respond_to(:region, :resource_category, :organization)
  end

  it "responds to validates attributes" do
    expect(ticket).to respond_to(:name, :phone, :region_id, :resource_category_id, :description)
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
