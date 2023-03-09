require 'rails_helper'

RSpec.describe UsersController, type: :controller do
   it {
   user = UsersController.new 
   expect(user).to be_truthy }
end