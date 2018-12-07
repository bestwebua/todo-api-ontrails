class UsersController < ApiController
  def create
    endpoint Users::Operation::Create
  end

  def destroy
    endpoint Users::Operation::Destroy
  end
end
