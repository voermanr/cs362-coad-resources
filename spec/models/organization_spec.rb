require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new}

  it "exists" do
    expect(organization).to be
  end

end
