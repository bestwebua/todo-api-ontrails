require 'rails_helper'

RSpec.describe 'V1::Users::Verifications API', type: :request do
  include Docs::V1::Users::Verifications::Api

  let(:user) { build(:user) }
  let!(:valid_attributes) { attributes_for(:user, password_confirmation: user.password) }

  describe 'GET /api/users/verifications' do
    include Docs::V1::Users::Verifications::Index

    # context 'valid request' do
    #   before { get '/api/users/verifications', params: valid_attributes.to_json }


    # end

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
        let(:token) { valid_token_generator(:email_token, user.id) }

        before do
          user.toggle!(:verified)
          # binding.pry
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
