require 'rails_helper'

RSpec.describe V1::Lib::Step::Auth::CheckUserVerification do
  describe '.call' do
    subject { described_class.call(ctx) }

    let(:user) { create(:user) }
    let(:ctx) { { model: user } }

    context 'not verified user' do
      it { is_expected.to eq(false) }
    end

    context 'verified user' do
      before { user.toggle!(:verified) }
      it { is_expected.to eq(true) }
    end
  end
end
