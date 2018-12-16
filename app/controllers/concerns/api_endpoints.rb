module ApiEndpoints
  def default_handler
    lambda do |match|
      match.created do |result|
        render jsonapi: result[:model], **result[:renderer_options], status: :created
      end

      match.invalid do |result|
        render jsonapi_errors: result['contract.default'].errors,
               class: { 'Reform::Form::ActiveModel::Errors': JSONAPI::Rails::SerializableActiveModelErrors },
               status: :unprocessable_entity
      end

      match.email_token_invalid do |result|
        render json: result, status: :unprocessable_entity
      end

      match.user_already_verified do |result|
        render json: result, status: :unprocessable_entity
      end
    end
  end

  def endpoint(operation_class, _options = {}, &block)
    ApiEndpoint.call(operation_class, default_handler, { params: params.to_unsafe_h }, &block)
  end
end
