module ApiEndpoints
  def default_handler
    lambda do |model|
      model.created do |result|
        render jsonapi: result[:model], **result[:renderer_options], status: :created
      end

      model.invalid do |result|
        render jsonapi_errors: result['contract.default'].errors,
               class: { 'Reform::Form::ActiveModel::Errors': JSONAPI::Rails::SerializableActiveModelErrors },
               status: :unprocessable_entity
      end
    end
  end

  def endpoint(operation_class, _options = {}, &block)
    ApiEndpoint.call(operation_class, default_handler, { params: params.to_unsafe_h }, &block)
  end
end
