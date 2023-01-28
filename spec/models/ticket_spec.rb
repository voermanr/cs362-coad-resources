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
    it { should belong_to(:organization).without_validating_presence }
  end

end
