require 'rails_helper'

RSpec.describe V1::Lib::Step::Auth::CreateTokens do
  describe '.call' do
    subject { described_class.call(ctx) }

    let(:user) { create(:user) }
    let(:ctx) { { model: user } }

    context 'creates access token' do
      it { is_expected.to include(:access) }
    end
  end
end
