module ControllerSpecHelper
  def valid_headers(version = 'v1')
    {
      'Content-Type': 'application/json'
    }.merge('Accept': "application/vnd.api.#{version}")
  end

  def valid_token_generator(token_type, user_id = rand(1..10))
    case token_type
    when :email_token
      then V1::Lib::Service::EmailToken.create(user_id: user_id)
    when :access_token
      then JWTSessions::Session.new(payload: { user_id: user.id }).login[:access]
    end
  end

  def invalid_token_generator(token_type, user_id = rand(1..10))
    case token_type
    when :email_token then V1::Lib::Service::EmailToken.create({ user_id: user_id }, Time.now.to_i - 10)
    end
  end

  # def request(headers)
  # need to implement request helper, for ctx[:request]
  # for V1::Lib::Step::Auth::AuthorizeUser testing
  # end
end
