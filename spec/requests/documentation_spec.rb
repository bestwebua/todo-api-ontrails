require 'rails_helper'

RSpec.describe 'Api::Documentation', type: :request do
  before(:context) do
    current_doc = Rails.public_path.join('docs', 'v1.html').to_s
    @env = RspecFileChef::FileChef.new(current_doc)
    @env.make
  end

  after(:context) do
    @env.clear
  end

  let(:html_markup) { '<!DOCTYPE html>' }

  describe 'GET /api/documentation/:version' do
    describe 'returns documentation' do
      context 'with existing version' do
        before { get '/api/documentation/v1' }

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'render static html' do
          expect(response.body).to include(html_markup)
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

  describe 'GET /' do
    context 'returns default documentation version' do
      before do
        get '/'
        follow_redirect!
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'render static html' do
        expect(response.body).to include(html_markup)
      end
    end
  end
end
