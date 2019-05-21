JWTSessions.token_store = Rails.env.test? ? :memory : :redis
JWTSessions.encryption_key = 'secret'
