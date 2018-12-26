module V1::Auth::Sessions::Operation
  class Create < Trailblazer::Operation
    step V1::Lib::Step::Auth::Users::Authenticate
    fail :invalid_credentials, fail_fast: true

    def invalid_credentials(ctx, **)
      ctx[:errors] ||= {}
      ctx[:errors][:credentials] = [I18n.t('errors.invalid_credentials')]
    end
  end
end
