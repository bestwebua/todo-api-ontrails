describe V1::Users::EmailConfirmationWorker, type: :worker do
  let(:user) { create(:user) }
  let(:token) { valid_token_generator(:email_token, user.id) }
  let(:user_verification_path) { Faker::Internet.slug }

  it 'should call UserMailer' do
    expect(UserMailer).to receive_message_chain(:confirmation, :deliver_now)
    subject.perform(user, token, user_verification_path)
  end
end
