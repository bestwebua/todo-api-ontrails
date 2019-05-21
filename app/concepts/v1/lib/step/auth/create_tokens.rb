module V1::Lib::Step::Auth
  class CreateTokens
    extend Uber::Callable

    def self.call(ctx, **)
      user = ctx[:model]
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload,
                                         refresh_by_access_allowed: true,
                                         namespace: "user_#{user.id}")
      ctx[:tokens] = { access: session.login[:access] }
    end
  end
end
