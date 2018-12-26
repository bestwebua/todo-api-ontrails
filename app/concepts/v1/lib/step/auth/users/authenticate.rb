module V1::Lib::Step::Auth::Users
  class Authenticate
    # shared step for create new session, change credentials, erase account

    extend Uber::Callable

    def initialize(email:, password:)
      @email, @password = email, password
    end

    def call
      user
    end

    def self.call(ctx, **)
      user_credentials = ctx[:params].slice(:email, :password).symbolize_keys
      ctx[:model] = new(user_credentials).call
    end

    private

      attr_reader :email, :password

      def user
        user = User.find_by(email: email)
        return user if user && user.authenticate(password)
        false
      end
  end
end
