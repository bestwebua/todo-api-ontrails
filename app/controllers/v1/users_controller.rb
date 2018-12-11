module V1
  class UsersController < ApiController
    def create
      endpoint V1::Users::Operation::Create
    end

    def destroy
      endpoint V1::Users::Operation::Destroy
    end
  end
end
