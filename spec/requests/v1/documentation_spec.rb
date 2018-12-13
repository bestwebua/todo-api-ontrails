require 'rails_helper'

RSpec.describe 'V1::Documentation', type: :request do
  before(:context) do
    current_doc = Rails.public_path.join('docs', 'v1.html').to_s
    @env = RspecFileChef::FileChef.new(current_doc)
    @env.make
  end

  after(:context) do
    @env.clear
  end

  describe 'GET /api/documentation/:version' do
    describe 'returns documentation' do
      # context 'without headers' do
      #   before { get '/api/documentation' }

      #   it 'returns status code 200' do
      #     expect(response).to have_http_status(200)
      #   end

      #   it 'render static html' do
      #     expect(response.body).to match /<!DOCTYPE html>/
      #   end
      # end

      context 'with existing version' do
        before { get '/api/documentation/v1' }

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'render static html' do
          expect(response.body).to match /<!DOCTYPE html>/
        end
      end
    end

    describe 'not returns documentation'  do
      context 'static documentation file not exists' do
        before { get '/api/documentation/v42' }

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns error message' do
          expect(body).to match("#{I18n.t('errors.file_not_found')}")
        end
      end
    end
  end
end
