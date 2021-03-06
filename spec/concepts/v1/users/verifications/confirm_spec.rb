require 'rails_helper'

RSpec.describe V1::Users::Verifications::Operation::Confirm do
  subject(:result) { described_class.call(params: params) }

  let(:user) { create(:user) }
  let(:valid_email_token) { valid_token_generator(:email_token, user.id) }
  let(:valid_params) { { email_token: valid_email_token } }

  describe 'Success' do
    let(:params) { valid_params }

    it 'verifies user' do
      expect { result }.to change { user.reload.verified }.from(false).to(true)
      expect(result[:errors]).not_to be(nil)
      expect(result).to be_success
    end
  end

  describe 'Fail' do
    context 'invalid token' do
      let(:invalid_email_token) { invalid_token_generator(:email_token, user.id) }
      let(:params) { valid_params.merge(email_token: invalid_email_token) }
      let(:errors) { { unprocessable_entity: { email_token: [I18n.t('errors.invalid_email_token')] } } }

      include_examples 'has validation errors'
    end

    context 'user already verified' do
      let(:params) { valid_params }
      before { user.toggle!(:verified) }
      let(:errors) { { unprocessable_entity: { user_account: [I18n.t('errors.user_already_verified')] } } }

      include_examples 'has validation errors'
    end
  end
end
