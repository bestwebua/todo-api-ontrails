module V1::Users::Verifications::Operation
  class Confirm < Trailblazer::Operation
    step Rescue(JWT::DecodeError, handler: :invalid_token) {
      step :confirm_email!
    }, fail_fast: true

    step :user_not_verified?
    fail :user_already_verified, fail_fast: true
    step :verify_user!

    def confirm_email!(ctx, **)
      payload = V1::Lib::Service::EmailToken.read(ctx[:params][:email_token])
      ctx[:model] = User.find(payload[:user_id])
    end

    def invalid_token(_exception, ctx)
      ctx[:errors] ||= {}
      ctx[:errors][:email_token] = I18n.t('errors.invalid_token')
    end

    def user_not_verified?(ctx, **)
      !ctx[:model].verified?
    end

    def user_already_verified(ctx, **)
      ctx[:errors] ||= {}
      ctx[:errors][:user_account] = I18n.t('errors.user_already_verified')
    end

    def verify_user!(ctx, **)
      ctx[:model].toggle!(:verified)
    end
  end
end
