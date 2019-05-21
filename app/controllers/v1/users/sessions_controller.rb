module V1
  module Users
    class SessionsController < ApiController
      def create
        endpoint V1::Users::Sessions::Operation::Create
      end

      def destroy
        authorize_by_access_header!
        endpoint V1::Users::Sessions::Operation::Destroy, payload: payload
      end
    end
  end
end
