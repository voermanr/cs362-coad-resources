require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "exists" do
    org = Organization.new
    expect(org).to be
  end

end
