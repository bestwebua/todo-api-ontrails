class Endpoint < Trailblazer::Endpoint
  Matcher = Dry::Matcher.new(
    created: Dry::Matcher::Case.new(
      match:   ->(result) { result.success? && result['model.action'] == :new },
      resolve: ->(result) { result }
    )
  )

  def matcher
    Endpoint::Matcher
  end
end
