module ConceptSpecHelper
  def match_validation_errors(operation_result, error_messages)
    expect(operation_result).to be_failure
    errors =
      operation_result['contract.default'] ?
        operation_result['contract.default'].errors.messages : operation_result[:errors]
    expect(errors).to match(error_messages)
  end
end
