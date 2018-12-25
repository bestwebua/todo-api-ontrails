require 'rails_helper'

RSpec.describe UserMailer do
  describe '#confirmation' do
    let(:email) { Faker::Internet.email }
    let(:token) { Faker::Internet.domain_word }
    let(:path) { Faker::Internet.url }
    let(:subject) { UserMailer.confirmation(email, token, path) }

    specify { expect(subject.to).to include(email) }
    specify { expect(subject.from).to include(Rails.configuration.default_sender_email) }
    specify { expect(subject.subject).to eq(I18n.t('user_mailer.subject')) }
    specify { expect(subject.body.encoded).to include(URI.parse("#{path}?email_token=#{token}").to_s) }
  end
end
