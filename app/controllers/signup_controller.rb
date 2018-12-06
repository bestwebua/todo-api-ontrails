class SignupController < ApplicationController
  def create
    endpoint Users::Operation::Create
  end
end
