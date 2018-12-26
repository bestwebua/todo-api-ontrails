module V1::Lib::Service
  class AuthenticateUser
    def initialize(email:, password:)
      @email, @password = email, password
    end

    def call
      user
    end

    def self.call(**user_credentials)
      new(user_credentials).call
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
