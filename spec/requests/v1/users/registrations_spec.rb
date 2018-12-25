require 'rails_helper'

RSpec.describe 'V1::Users::Registrations API', type: :request do
  include Docs::V1::Users::Registrations::Api

  let(:user) { build(:user) }
  let!(:valid_attributes) { attributes_for(:user, password_confirmation: user.password) }

  describe 'POST /api/users/registration' do
    include Docs::V1::Users::Registrations::Create

    context 'valid request' do
      before { post '/api/users/registration', params: valid_attributes.to_json, headers: valid_headers }

      it 'sign up success', :dox do
        expect(response).to be_created
      end

      it 'creates a new user' do
        expect(response).to match_json_schema('user/registration/create/create')
      end
    end

    context 'invalid request' do
      before { post '/api/users/registration' }

      it 'sign up fails', :dox do
        expect(response).to be_unprocessable
      end

      it 'returns error' do
        expect(response).to match_json_schema('errors')
      end
    end
  end
end
