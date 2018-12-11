
require 'rails_helper'

RSpec.describe 'V1::User API', type: :request do

  let(:user) { build(:user) }
  let!(:valid_attributes) { attributes_for(:user, password_confirmation: user.password) }

  describe 'POST /api/auth' do
    context 'valid request' do
      before { post '/api/auth', params: valid_attributes, headers: valid_headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
        expect(response).to match_json_schema('user/create')
      end
    end

    context 'invalid request' do
      before { post '/api/auth' }

      it 'returns error' do
        expect(response).to have_http_status(422)
        expect(response).to match_json_schema('errors')
      end
    end
  end
end
