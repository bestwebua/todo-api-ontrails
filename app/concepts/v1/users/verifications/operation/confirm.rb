module V1::Users::Verifications::Operation
  class Confirm < Trailblazer::Operation
    step :token_valid?
    fail :invalid_token, fail_fast: true
    step :confirm_user!
    fail :user_already_verified, fail_fast: true

    def token_valid?(ctx, **)
      V1::Lib::Service::EmailToken.read(ctx[:params][:email_token])
      ctx[:payload] = V1::Lib::Service::EmailToken.read(ctx[:params][:email_token])
    end

    def invalid_token(ctx, **)
      ctx[:errors] = { user_verification_errors: { email_token: I18n.t('errors.invalid_token') } }
    end

    def confirm_user!(ctx, **)
      user = User.find(ctx[:payload][:user_id])
      return false if user.verified?
      user.toggle!(:verified)
    end

    def user_already_verified(ctx, **)
      ctx[:errors] = { user_verification_errors: { user_account: I18n.t('errors.user_already_verified') } }
    end
  end
end
