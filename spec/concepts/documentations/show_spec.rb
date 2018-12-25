require 'rails_helper'

RSpec.describe Documentations::Operation::Show do
  before(:context) do
    current_doc = Rails.public_path.join('docs', 'v1.html').to_s
    @env = RspecFileChef::FileChef.new(current_doc)
    @env.make
  end

  after(:context) do
    @env.clear
  end

  subject(:result) { described_class.call(params: params) }

  describe 'Success' do
    let(:params) { { version: 'v1' } }
    specify { expect(result).to be_success }
  end

  describe 'Fail' do
    let(:params) { { version: 'v42' } }
    specify { expect(result).to be_failure }
  end
end
