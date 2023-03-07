require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
        it {expect(get(:index)).to be_successful}
end
