module V1
  module Users
    class EraseNotVerificatedUsersWorker
      include Sidekiq::Worker

      def perform
        V1::Users::UsersToDeleteQuery.call.destroy_all
      end
    end
  end
end
