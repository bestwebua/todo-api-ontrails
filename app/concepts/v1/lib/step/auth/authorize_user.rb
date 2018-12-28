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
    end

    def self.call(_ctx, request:, **)
      new(request).call
    end
  end
end
