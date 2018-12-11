module ControllerSpecHelper
  def valid_headers(version = 'v1')
    {
      'Content-Type': 'application/json'
    }.merge('Accept': "application/vnd.api.#{version}")
  end
end
