module V1::Lib::Service
  class EmailToken
    DEFAULT_TOKEN_EXPIRATION = 24.hours.from_now
    HMAC_SECRET = Rails.application.credentials.secret_jwt_encryption_key

    class << self
      def create(payload, exp = DEFAULT_TOKEN_EXPIRATION)
        check_secret_key
        payload[:exp] = exp.to_i
        JWT.encode(payload, HMAC_SECRET)
      end

      def read(token)
        check_secret_key
        body = JWT.decode(token, HMAC_SECRET).first
        HashWithIndifferentAccess.new(body)
      end

      def check_secret_key
        raise 'Secret key not assigned' unless HMAC_SECRET
      end
    end
  end
end
