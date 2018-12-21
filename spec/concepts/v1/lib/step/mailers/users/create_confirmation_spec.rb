require 'rails_helper'

RSpec.describe V1::Lib::Step::Mailers::Users::CreateConfirmation do
  let(:params) { {} }
  let(:user) { create(:user) }

  describe '.call' do
    after { described_class.call(params, model: user) }

    specify do
      allow(V1::Lib::Service::EmailToken).to receive(:create)
      expect(V1::Lib::Service::EmailToken).to receive(:create)
    end

    specify do
      allow(Rails).to receive_message_chain(:application, :config, :user_verification_path)
      expect(Rails).to receive_message_chain(:application, :config, :user_verification_path)
    end

    specify do
      allow(V1::Users::EmailConfirmationWorker).to receive(:perform_async)
      expect(V1::Users::EmailConfirmationWorker).to receive(:perform_async)
    end
  end
end
