module ApiEndpoints
  def default_handler
    lambda do |match|
      match.created do |result|
        render jsonapi: result[:model], **result[:renderer_options], status: :created
      end

      match.invalid do |result|
        errors = result['contract.default'] ? result['contract.default'].errors : result[:errors]
        render jsonapi_errors: errors,
               class: {
                        'Reform::Form::ActiveModel::Errors': JSONAPI::Rails::SerializableActiveModelErrors,
                        'Hash': V1::Lib::Representer::VerificationErrorsSerializer
                      },
               status: :unprocessable_entity
      end

      match.verified do |result|
        render :no_content
      end
    end
  end

  def endpoint(operation_class, _options = {}, &block)
    ApiEndpoint.call(operation_class, default_handler, { params: params.to_unsafe_h }, &block)
  end
end
