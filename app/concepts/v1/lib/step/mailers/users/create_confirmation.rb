module V1::Lib::Step::Mailers::Users
  class CreateConfirmation
    extend Uber::Callable

    def self.call(ctx, model:, **)
      token = V1::Lib::Service::EmailToken.create(user_id: model.id)
      UserMailer.confirmation(model, token).deliver_later
    end
  end
end
