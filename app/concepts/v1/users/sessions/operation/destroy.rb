module V1::Users::Sessions::Operation
  class Destroy < Trailblazer::Operation
    step V1::Lib::Step::Error::InitializeCustomErrors

    step Rescue(JWTSessions::Errors::Unauthorized, handler: :invalid_token) {
      step V1::Lib::Step::Auth::AuthorizeUser
    }, fail_fast: true

    step V1::Lib::Step::Session::Destroy

    def invalid_token(_exception, ctx)
      V1::Lib::Service::AddCustomError.(ctx, :unprocessable_entity, access_token: I18n.t('errors.invalid_access_token'))
    end
  end
end
