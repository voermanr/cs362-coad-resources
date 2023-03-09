require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
  describe do
    let(:a_new_user) { create(:user) }
    let(:a_resource_category) { create(:resource_category) }
    it do


      visit(signup_url)
      # save_and_open_page
      fill_in('user_email', with: a_new_user.email)
      fill_in('user_password', with: a_new_user.encrypted_password)
      fill_in('user_password_confirmation', with: a_new_user.encrypted_password)

      allow_any_instance_of(Recaptcha::Adapters::ControllerMethods).to receive(:verify_recaptcha).and_return(true)

      click_button('commit')

      expect(current_url).to eq(user_registration_url)

    end

    describe 'its not recaptcha tho' do
      it do
        visit(signup_url)
        # save_and_open_page
        fill_in('user_email', with: a_new_user.email)
        fill_in('user_password', with: a_new_user.encrypted_password)
        fill_in('user_password_confirmation', with: a_new_user.encrypted_password)
        allow_any_instance_of(Recaptcha::Adapters::ControllerMethods).to receive(:verify_recaptcha).and_return(false)
        click_button('commit')


        expect(current_url).to eq(user_registration_url)
      end
    end
  end
end
