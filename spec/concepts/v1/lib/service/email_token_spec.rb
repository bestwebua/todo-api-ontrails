require 'rails_helper'

RSpec.describe V1::Lib::Service::EmailToken do
  let(:user) { create(:user) }
  let(:payload) { { user_id: user.id } }

  context 'hmac secret exists' do
    describe '.create' do
      specify { expect(described_class.create(payload)).to be_an_instance_of(String) }
    end

    describe '.read' do
      let(:token) { valid_token_generator(:email_token, user.id) }
      specify { expect(described_class.read(token)).to include(user_id: user.id) }
    end
  end


  context 'hmac secret not exists' do
    before { stub_const('V1::Lib::Service::EmailToken::HMAC_SECRET', nil) }

    specify do
      expect { described_class.create(payload) }.to raise_error(RuntimeError, /Secret key not assigned/)
      expect { described_class.read(payload) }.to raise_error(RuntimeError, /Secret key not assigned/)
    end
  end
end
