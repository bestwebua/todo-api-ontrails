class ApiEndpoint < Trailblazer::Endpoint
  Matcher = Dry::Matcher.new(
    created: Dry::Matcher::Case.new(
      match:   ->(result) { result.success? && result['model.action'] == :new },
      resolve: ->(result) { result }
    ),
    invalid: Dry::Matcher::Case.new(
      match:   ->(result) { result.failure? && (
                            result[:errors] ||
                            result['result.contract.default'] &&
                            result['result.contract.default'].failure?) },
      resolve: ->(result) { result }
    ),
    verified: Dry::Matcher::Case.new(
      match:   ->(result) { result.success? && result[:model].verified? },
      resolve: ->(result) { result }
    )
  )

  def matcher
    ApiEndpoint::Matcher
  end
end
