module V1
  class ApiController < ApplicationController
    include ApiEndpoints
    include Authentication
  end
end
