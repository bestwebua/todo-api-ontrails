require 'rails_helper'

RSpec.describe V1::Users::UsersToDeleteQuery do
  describe '.call' do
    subject { described_class.call }

    context 'users not found' do
      it { is_expected.to be_empty }
    end

    context 'users found' do
      let(:not_confirmed_user) { create(:user) }
      let!(:confirmed_user) { create(:user) }

      before do
        not_confirmed_user
        confirmed_user.toggle!(:verified)
        stub_const('V1::Users::UsersToDeleteQuery::LIFETIME', 0)
      end

      it 'returns not verificated users' do
        expect(subject.first.id).to eq(not_confirmed_user.id)
        expect(subject.count).to eq(1)
      end
    end
  end
end
