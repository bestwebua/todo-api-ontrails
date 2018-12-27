module V1::Users::Sessions::Operation
  class Create < Trailblazer::Operation
    step V1::Lib::Step::Error::InitializeCustomErrors
    step V1::Lib::Step::Auth::AuthenticateUser
    fail :invalid_credentials, fail_fast: true

    step :user_verified?
    fail :user_not_verified, fail_fast: true

    step :create_session

    def create_session(ctx, **)
      user = ctx[:model]
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload,
                                         refresh_by_access_allowed: true,
                                         namespace: "user_#{user.id}")
      ctx[:tokens] = session.login
    end

    def invalid_credentials(ctx, **)
      V1::Lib::Service::AddCustomError.(ctx, :unauthorized, credentials: I18n.t('errors.invalid_credentials'))
    end

    def user_verified?(ctx, **)
      ctx[:model].verified?
    end

    def user_not_verified(ctx, **)
      V1::Lib::Service::AddCustomError.(ctx, :unauthorized, user_account: I18n.t('errors.user_not_verified'))
    end
  end
end
