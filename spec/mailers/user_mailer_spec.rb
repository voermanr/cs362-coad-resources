require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#new_organization_application' do
    let(:user) { create(:user) }
    let(:new_organization) { create(:organization) }

    it 'sends an email when in production environment' do
      expect { UserMailer.with(to: user.email, new_organization: new_organization).new_organization_application.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)

      expect(ActionMailer::Base.deliveries.last.subject).to eq('New Organization Application Pending')
      expect(ActionMailer::Base.deliveries.last.to).to eq([user.email])
    end

    it 'does not send an email when not in production environment' do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development'))

      expect { UserMailer.with(to: user.email, new_organization: new_organization).new_organization_application.deliver_now }.to_not (change { ActionMailer::Base.deliveries.count })
    end
  end
end
