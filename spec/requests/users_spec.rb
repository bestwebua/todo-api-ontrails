
require 'rails_helper'

RSpec.describe 'User API', type: :request do

  let(:user) { build(:user) }
  let!(:valid_attributes) { attributes_for(:user, password_confirmation: user.password) }

  describe 'POST /api/auth' do
    context 'valid request' do
      before { post '/api/auth', params: valid_attributes.to_json, headers: valid_headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
