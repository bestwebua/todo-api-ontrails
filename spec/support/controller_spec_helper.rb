module ControllerSpecHelper
  def valid_headers(version = 'v1')
    {
      'Content-Type': 'application/json'
    }.merge('Accept': "application/vnd.api.#{version}")
  end

  def valid_token_generator(token_type, user_id)
    case token_type
    when :email_token then V1::Lib::Service::EmailToken.create(user_id: user_id)
    end
  end

  def invalid_token_generator(token_type, user_id)
    case token_type
    when :email_token then V1::Lib::Service::EmailToken.create({ user_id: user_id }, Time.now.to_i - 10)
    end
  end
end
