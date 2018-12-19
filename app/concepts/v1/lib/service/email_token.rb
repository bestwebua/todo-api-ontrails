module V1::Lib::Service
  class EmailToken
    class << self
      DEFAULT_TOKEN_EXPIRATION = 24.hours.from_now
      HMAC_SECRET = Rails.application.credentials.secret_jwt_encryption_key

      def create(payload, exp = DEFAULT_TOKEN_EXPIRATION)
        payload[:exp] = exp.to_i
        JWT.encode(payload, HMAC_SECRET)
      end

      def read(token)
        body = JWT.decode(token, HMAC_SECRET).first
        HashWithIndifferentAccess.new(body)
      end
    end
  end
end
