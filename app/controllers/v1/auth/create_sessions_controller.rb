module V1
  module Auth
    class CreateSessionsController < ApiController
      def create
        endpoint V1::Auth::Sessions::Operation::Create
      end
    end
  end
end
