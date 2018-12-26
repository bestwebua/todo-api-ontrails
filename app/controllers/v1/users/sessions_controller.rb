module V1
  module Users
    class SessionsController < ApiController
      def create
        endpoint V1::Users::Sessions::Operation::Create
      end
    end
  end
end
