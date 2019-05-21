require 'rails_helper'

RSpec.describe V1::Lib::Step::Auth::AuthenticateUser do
  describe '.call' do
    subject { described_class.call(user_credentials) }
    let!(:user) { create(:user) }

    context 'valid credentials' do
      let(:user_credentials) { { params: { email: user.email, password: user.password } } }
      it { is_expected.to be_an_instance_of(User) }
    end

    context 'invalid credentials' do
      let(:user_credentials) { { params: { email: Faker::Internet.email, password: Faker::Internet.password } } }
      it { is_expected.to be(false) }
    end
  end
end
