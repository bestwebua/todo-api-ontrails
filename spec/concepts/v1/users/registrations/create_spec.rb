require 'rails_helper'

RSpec.describe V1::Users::Registrations::Operation::Create do
  subject(:result) { described_class.call(params: params) }
  let(:user) { build(:user) }
  let(:valid_params) do
    {
      email: user.email,
      password: user.password,
      password_confirmation: user.password
    }
  end

  describe 'Success' do
    let(:params) { valid_params }

    it 'creates user' do
      expect(V1::Lib::Step::Mailers::Users::CreateConfirmation).to receive(:call).and_return(true)

      expect { result }.to change(User, :count).from(0).to(1)
      expect(result[:errors]).not_to be(nil)
      expect(result[:model]).to be_persisted
      expect(result).to be_success
    end
  end

  describe 'Fail' do
    context 'empty keys' do
      let(:params) { {} }
      let(:errors) do
        {
          email: ["can't be blank"],
          password: ["can't be blank", 'is too short (minimum is 6 characters)']
        }
      end

      include_examples 'has validation errors'
    end

    context 'different passwords' do
      let(:params) { valid_params.merge(password_confirmation: '') }
      let(:errors) { { password_confirmation: [I18n.t('errors.password_mismatch')] } }

      include_examples 'has validation errors'
    end

    context 'email already exists' do
      let(:existing_user) { create(:user) }
      let(:params) { valid_params.merge(email: existing_user.email) }
      let(:errors) { { email: ['has already been taken'] } }

      include_examples 'has validation errors'
    end
  end
end
