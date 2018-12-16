class ApiEndpoint < Trailblazer::Endpoint
  Matcher = Dry::Matcher.new(
    created: Dry::Matcher::Case.new(
      match:   ->(result) { result.success? && result['model.action'] == :new },
      resolve: ->(result) { result }
    ),
    invalid: Dry::Matcher::Case.new(
      match:   ->(result) { result.failure? && result['result.contract.default'] && result['result.contract.default'].failure? },
      resolve: ->(result) { result }
    ),
    email_token_invalid: Dry::Matcher::Case.new(
      match:   ->(result) { result.failure? && result[:errors][:user_verification_errors][:email_token] },
      resolve: ->(result) { result[:errors][:user_verification_errors] }
    ),
    user_already_verified: Dry::Matcher::Case.new(
      match:   ->(result) { result.failure? && result[:errors][:user_verification_errors][:user_account] },
      resolve: ->(result) { result[:errors][:user_verification_errors] }
    )
  )

  def matcher
    ApiEndpoint::Matcher
  end
end
