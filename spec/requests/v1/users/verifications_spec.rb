require 'rails_helper'

RSpec.describe 'V1::Users::Verifications API', type: :request do
  include Docs::V1::Users::Verifications::Api

  let(:user) { create(:user) }
  let(:token) { valid_token_generator(:email_token, user.id) }

  describe 'GET /api/users/verifications' do
    include Docs::V1::Users::Verifications::Index

    describe 'verification successfully completed' do
      context 'valid request' do
        before { get "/api/users/verification?email_token=#{token}" }

        it 'confirm user' do
          expect(response).to be_ok
        end

        it 'verificatioin complete', :dox do
          expect(response).to have_http_status(200)
        end
      end
    end

    describe 'verification fails' do
      context 'invalid request' do
        before { get '/api/users/verification' }

        it 'returns error' do
          expect(response).to be_unprocessable
          expect(response).to match_json_schema('user/verification/confirm/errors')
        end

        it 'verificatioin fails', :dox do
          expect(response).to have_http_status(422)
        end
      end

      context 'user already verified' do
        before do
          user.toggle!(:verified)
          get "/api/users/verification?email_token=#{token}"
        end

        it 'returns error' do
          expect(response).to be_unprocessable
          expect(response).to match_json_schema('user/verification/confirm/errors')
        end

        it 'verificatioin fails', :dox do
          expect(response).to have_http_status(422)
        end
      end
    end
  end
end
