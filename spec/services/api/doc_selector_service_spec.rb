require 'rails_helper'

RSpec.describe Api::DocSelectorService do
  describe '.call' do
    let(:version) { Faker::Internet.domain_word }

    it 'returns pathname instance' do
      expect(described_class.call(version)).to be_an_instance_of(Pathname)
    end

    specify do
      expect(described_class.call(version).to_s).to match(/docs\/#{version}.html/)
    end
  end
end
