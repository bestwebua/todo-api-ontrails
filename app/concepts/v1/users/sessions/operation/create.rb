module V1::Users::Sessions::Operation
  class Create < Trailblazer::Operation
    step V1::Lib::Step::Error::InitializeCustomErrors

    step V1::Lib::Step::Auth::AuthenticateUser
    fail :invalid_credentials, fail_fast: true

    step V1::Lib::Step::Auth::CheckUserVerification
    fail :user_not_verified, fail_fast: true

    step V1::Lib::Step::Auth::CreateTokens
    step :renderer_options

    def invalid_credentials(ctx, **)
      V1::Lib::Service::AddCustomError.(ctx, :unauthorized, credentials: I18n.t('errors.invalid_credentials'))
    end

    def user_not_verified(ctx, **)
      V1::Lib::Service::AddCustomError.(ctx, :unauthorized, user_account: I18n.t('errors.user_not_verified'))
    end

    def renderer_options(ctx, tokens:, **)
      ctx[:renderer_options] = { class: { User: V1::Users::Sessions::Representer::Create }, meta: { jwt: tokens } }
    end
  end
end
