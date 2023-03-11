require 'rails_helper'

RSpec.describe UsersController, type: :controller do
   it { expect(UsersController.new).to be_truthy }

   it { expect(Users::ConfirmationsController.new).to be }

   it { expect(Users::OmniauthCallbacksController.new).to be }

   it { expect(Users::PasswordsController).to be }

   it { expect(Users::UnlocksController).to be }
end