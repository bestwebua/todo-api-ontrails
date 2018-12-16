module V1
  module Users
    class VerificationsController < ApiController
      def index
        endpoint V1::Users::Verifications::Operation::Confirm
      end
    end
  end
end
