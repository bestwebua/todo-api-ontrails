require 'rails_helper'

RSpec.describe V1::Lib::Service::AddCustomError do
  subject { described_class.call(ctx, status, errors_collection) }

  let(:ctx) { { errors: {} } }
  let(:status) { :error_status }
  let(:errors_collection) { { attribute: :message } }
  let(:errors) { { error_status: { attribute: [:message] } } }

  describe '.call' do
    it { is_expected.to eq(errors) }
  end
end
