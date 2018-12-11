module ControllerSpecHelper
  def valid_headers(version = 'v1')
    {
      'Content-Type': 'application/vnd.api+json'
    }.merge('Accept': "application/vnd.api.#{version}")
  end
end
