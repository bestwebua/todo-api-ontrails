class ApiEndpoint < Trailblazer::Endpoint
  Matcher = Dry::Matcher.new(
    created: Dry::Matcher::Case.new(
      match:   ->(result) { result.success? && (
                            result['model.action'] == :new || result[:tokens]) },
      resolve: ->(result) { result }
    ),
    invalid: Dry::Matcher::Case.new(
      match:   ->(result) { result.failure? && (
                            result[:errors][:unprocessable_entity] ||
                            result['result.contract.default'] &&
                            result['result.contract.default'].failure?) },
      resolve: ->(result) { result }
    ),
    verified: Dry::Matcher::Case.new(
      match:   ->(result) { result.success? && result[:model].verified? },
      resolve: ->(result) { result }
    ),
    unauthorized: Dry::Matcher::Case.new(
      match:   ->(result) { result[:errors][:unauthorized] },
      resolve: ->(result) { result }
    )
  )

  def matcher
    ApiEndpoint::Matcher
  end
end
