require 'rails_helper'

RSpec.describe V1::Lib::Step::Auth::AuthorizeUser, type: :request do
  describe '.call' do
    subject { described_class.call(params) }

    let(:user) { create(:user, verified: :true) }
    let(:access_token) { valid_token_generator(:access_token, user.id) }
    let(:headers) { valid_headers.merge('Authorization': access_token) }
    let(:valid_params) { {  } } # how create request helper for ctx???

    context '' do
      let(:params) { valid_params }
      it '' do

      end
    end
  end
end
