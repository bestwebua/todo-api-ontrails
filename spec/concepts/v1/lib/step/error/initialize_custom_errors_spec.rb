require 'rails_helper'

RSpec.describe V1::Lib::Step::Error::InitializeCustomErrors do
  describe '.call' do
    subject { described_class.call(ctx: {}) }
    it { is_expected.to be_an_instance_of(Hash) }
  end
end
