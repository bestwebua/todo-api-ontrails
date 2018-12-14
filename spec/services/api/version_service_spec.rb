require 'rails_helper'

RSpec.describe Api::VersionService do
  let(:request) { double }
  let(:headers) { { accept: 'application/vnd.api.v1' } }

  before { allow(request).to receive(:headers).and_return(headers) }

  describe '#new' do
    subject { described_class.new('v1') }
    specify { expect(subject.version).to eq('v1') }
    specify { expect(subject.default).to be(false) }
  end

  describe '#matches?' do
    subject { described_class.new('v1') }

    context 'request contains defined api version' do
      specify { expect(subject.matches?(request)).to be(true) }
    end

    context 'request not contains defined api version' do
      let(:headers) { { accept: 'application/vnd.api.v2' } }
      specify { expect(subject.matches?(request)).to be(false) }
    end
  end
end
