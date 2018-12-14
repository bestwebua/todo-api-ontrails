module V1
  module Users
    class RegistrationsController < ApiController
      def create
        endpoint V1::Users::Registrations::Operation::Create
      end
    end
  end
end
