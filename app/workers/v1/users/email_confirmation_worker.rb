module V1
  module Users
    class EmailConfirmationWorker
      include Sidekiq::Worker

      def perform(user, token, user_verification_path)
        UserMailer.confirmation(user, token, user_verification_path).deliver_now
      end
    end
  end
end
