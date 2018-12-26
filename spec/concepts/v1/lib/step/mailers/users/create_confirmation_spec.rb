require 'rails_helper'

RSpec.describe V1::Lib::Step::Mailers::Users::CreateConfirmation do
  describe '.call' do
    let(:params) { {} }

    it '' do
      expect(V1::Lib::Service::EmailToken).to receive(:create).and_return('token')
      expect(Rails).to receive_message_chain(:application, :config, :user_verification_path).and_return('verification_path')
      expect(V1::Users::EmailConfirmationWorker).to receive(:perform_async).and_return(true)
      described_class.call(params, model: create(:user))
    end
  end
end
