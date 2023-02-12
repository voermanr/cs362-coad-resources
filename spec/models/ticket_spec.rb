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
    # let(:openticket) {create(:ticket, name: 'Test Open', closed: false)}
    # let(:closedticket) {create(:ticket, name: 'Test Closed', closed: true )}
    # let(:organizationticket) {create(:ticket, name: 'Test All_Organization', closed: false, organization_id: 1)}

    setup do
      rc = create(:resource_category, name: 'Test Resource Category')
      r = create(:region, name: 'Test Region')
      @open_ticket = create(:ticket, name: 'Test Open', resource_category: rc, region: r)
      @closed_ticket = create(:ticket, name: 'Test Closed', resource_category: rc, region: r, closed: true)
      @open_organization_ticket = create(:ticket, name: 'Test All_Organization', resource_category: rc, region: r, closed: false, organization_id: 1)
      @closed_organization_ticket = create(:ticket, name: 'Test Closed_Organization', resource_category: rc, region: r, closed: true, organization_id: 1)

    end

    it "includes tickets with open flag" do
      expect(Ticket.open).to include(@open_ticket)
    end

    it "includes tickets with close flag" do
      expect(Ticket.closed).to include(@closed_ticket)
    end

    it "includes tickets where organization is not nothing" do
      expect(Ticket.all_organization).to include(@open_organization_ticket)
    end

    it "includes ticket where organization id is specified" do
      expect(Ticket.organization(1)).to include(@open_organization_ticket)
      expect(Ticket.organization(1)).not_to include(@closed_organization_ticket)
    end

    it "Does not include open tickets in organization array" do
      expect(Ticket.closed_organization(1)).to include(@closed_organization_ticket)
      expect(Ticket.closed_organization(1)).not_to include(@open_organization_ticket)
    end

    #TODO: Check tickets have valid region_id and resource_category_id

    # it "Has tickets with a given valid region" do
    #   expect(ticket.where(region_id: 1)).to include(@open_ticket)
    # end

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
