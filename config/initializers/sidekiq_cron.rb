if Rails.env.development?
  Sidekiq::Cron::Job.create(
    name: 'Erase not verificated users - every 24h',
    cron: '* */24 * * *',
    class: 'V1::Users::EraseNotVerificatedUsersWorker'
  )
end
