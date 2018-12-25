require 'rails_helper'

RSpec.describe 'V1::Users::Verifications API', type: :request do
  include Docs::V1::Users::Verifications::Api

  let(:user) { create(:user) }
  let(:token) { valid_token_generator(:email_token, user.id) }
  let(:confirmation_url)  { "/api/users/verification?email_token=#{token}" }

  describe 'GET /api/users/verifications' do
    include Docs::V1::Users::Verifications::Index

    describe 'verification successfully completed' do
      context 'valid request' do
        before { get confirmation_url }

        it 'verificatioin complete', :dox do
          expect(response).to be_ok
        end
      end
    end

    describe 'verification fails' do
      context 'invalid request' do
        before { get '/api/users/verification' }

        it 'verificatioin fails', :dox do
          expect(response).to be_unprocessable
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'user already verified' do
        before do
          user.toggle!(:verified)
          get confirmation_url
        end

        it 'verificatioin fails', :dox do
          expect(response).to be_unprocessable
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end
    end
  end
end
