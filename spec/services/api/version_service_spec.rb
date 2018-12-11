require 'rails_helper'

RSpec.describe Api::VersionService do
  let(:request) do
    Class.new do
      define_method(:headers) do; end
    end.new
  end

  let(:headers) { { accept: 'application/vnd.api.v1' } }
  before { allow(request).to receive(:headers).and_return(headers) }

  describe '#new' do
    let(:instance) { described_class.new('v1') }
    specify { expect(instance.version).to eq('v1') }
    specify { expect(instance.default).to be(false) }
  end

  describe '#matches?' do
    let(:instance) { described_class.new('v1') }

    context 'request contains defined api version' do
      specify { expect(instance.matches?(request)).to be(true) }
    end

    context 'request not contains defined api version' do
      let(:headers) { { accept: 'application/vnd.api.v2' } }
      specify { expect(instance.matches?(request)).to be(false) }
    end
  end
end
