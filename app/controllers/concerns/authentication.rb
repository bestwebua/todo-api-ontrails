module Authentication
  def self.included(base)
    base.class_eval do
      include JWTSessions::RailsAuthorization

      rescue_from JWTSessions::Errors::Unauthorized do
        exception_respond(:unauthorized, I18n.t('errors.invalid_access_token'))
      end
    end
  end

  def current_user
    @current_user ||= User.find_by(id: payload['user_id'])
  end

  private

    def exception_respond(status, message)
      errors = { access_token: [message] }

      render jsonapi_errors: errors,
             class: { Hash: V1::Lib::Representer::CustomErrorsSerializer },
             status: status
    end
end
