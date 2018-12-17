module V1::Lib::Step::Mailers::Users
  class CreateConfirmation
    extend Uber::Callable

    def self.call(ctx, model:, **)
      token = V1::Lib::Service::EmailToken.create(user_id: model.id)
      user_verification_path = Rails.application.config.user_verification_path
      UserMailer.confirmation(model, token, user_verification_path).deliver_later
    end
  end
end
