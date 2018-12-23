module ConceptSpecHelper
  def match_validation_errors(operation_result, error_messages)
    expect(operation_result).to be_failure
    expect(operation_result['contract.default'].errors.messages).to match(error_messages)
  end
end
