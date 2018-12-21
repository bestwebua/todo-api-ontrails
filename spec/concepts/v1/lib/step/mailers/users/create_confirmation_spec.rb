require 'rails_helper'

RSpec.describe V1::Lib::Step::Mailers::Users::CreateConfirmation do
  let(:params) { {} }
  let(:user) { create(:user) }

  describe '.call' do
    before do
      allow(V1::Lib::Service::EmailToken).to receive(:create)
      allow(Rails).to receive_message_chain(:application, :config, :user_verification_path)
      allow(V1::Users::EmailConfirmationWorker).to receive(:perform_async)
    end

    after { described_class.call(params, model: user) }

    specify { expect(V1::Lib::Service::EmailToken).to receive(:create) }
    specify { expect(Rails).to receive_message_chain(:application, :config, :user_verification_path) }
    specify { expect(V1::Users::EmailConfirmationWorker).to receive(:perform_async) }
  end
end
