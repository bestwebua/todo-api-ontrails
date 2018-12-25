module V1
  module Users
    class UsersToDeleteQuery
      LIFETIME = 1.day

      def self.call
        User.where('verified = false AND created_at <= :one_day_gone',
          one_day_gone: Time.now - LIFETIME
        )
      end
    end
  end
end
