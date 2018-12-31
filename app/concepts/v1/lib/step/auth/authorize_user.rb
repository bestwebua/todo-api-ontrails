module V1::Lib::Step::Auth
  class AuthorizeUser
    extend Uber::Callable
    include JWTSessions::RailsAuthorization

    attr_reader :request

    def initialize(request)
      @request = request
    end

    def call
      authorize_by_access_header!
      payload
    end

    def self.call(ctx, request:, **)
      ctx[:payload] = new(request).call
      ctx[:model] = User.find_by(id: ctx[:payload]['user_id'])
    end
  end
end
