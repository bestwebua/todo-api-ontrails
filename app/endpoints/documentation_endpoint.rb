class DocumentationEndpoint < Trailblazer::Endpoint
  Matcher = Dry::Matcher.new(
    exists: Dry::Matcher::Case.new(
      match:   ->(result) { result.success? },
      resolve: ->(result) { result }
    ),
    not_exists: Dry::Matcher::Case.new(
      match:   ->(result) { result.failure? },
      resolve: ->(result) { result }
    )
  )

  def matcher
    DocumentationEndpoint::Matcher
  end
end
