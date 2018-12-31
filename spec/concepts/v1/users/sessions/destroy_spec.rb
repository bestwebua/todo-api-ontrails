require 'rails_helper'

RSpec.describe V1::Users::Sessions::Operation::Destroy do
  subject(:result) { described_class.call(params: params) }

  let(:user) { create(:user, verified: :true) }
  let(:valid_params) { { email: user.email, password: user.password } }


  describe 'Success' do
    # let(:params) { valid_params }

    # it 'creates session' do
    #   expect(result[:errors]).not_to be(nil)
    #   expect(result[:model]).to be_persisted
    #   expect(result[:tokens]).to include(:access)
    #   expect(result).to be_success
    # end
  end

  describe 'Fail' do
    # context 'invalid credentials' do
    #   let(:params) { valid_params.merge(password: 'password') }
    #   let(:errors) { { unauthorized: { credentials: [I18n.t('errors.invalid_credentials')] } } }

    #   include_examples 'has validation errors'
    # end

    # context 'user not verified' do
    #   before { user.toggle!(:verified) }

    #   let(:params) { valid_params }
    #   let(:errors) { { unauthorized: { user_account: [I18n.t('errors.user_not_verified')] } } }

    #   include_examples 'has validation errors'
    # end
  end
end
