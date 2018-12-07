
require 'rails_helper'

RSpec.describe 'User API', type: :request do

  let(:headers) do
    {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json'
    }
  end

  let(:valid_attributes) do
    {
      email: Faker::Internet.email,
      password: '123456',
      password_confirmation: '123456'
    }.to_json
  end

  describe 'POST /api/auth' do
    context 'valid request' do
      before { binding.pry; post '/api/auth', params: valid_attributes, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
