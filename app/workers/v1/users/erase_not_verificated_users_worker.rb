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

Sidekiq::Cron::Job.create(
  name: 'Erase not verificated users - every 24h',
  cron: '* */24 * * *',
  class: 'V1::Users::EraseNotVerificatedUsersWorker')
