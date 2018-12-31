module V1::Lib::Step::Session
  class Destroy
    extend Uber::Callable

    def self.call(ctx, payload:, **)
      session = JWTSessions::Session.new(refresh_by_access_allowed: true, payload: payload)
      session.flush_by_access_payload
    end
  end
end
