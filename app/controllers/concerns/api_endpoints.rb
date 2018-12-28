module ApiEndpoints
  def default_handler
    lambda do |match|
      match.created do |result|
        render jsonapi: result[:model], **result[:renderer_options], status: :created
      end

      # 422 Unprocessable Entity
      match.invalid do |result|
        errors = result['contract.default'] ? result['contract.default'].errors : result[:errors][:unprocessable_entity]
        render jsonapi_errors: errors,
               class: {
                        'Reform::Form::ActiveModel::Errors': V1::Lib::Representer::ReformErrorsSerializer,
                        'Hash': V1::Lib::Representer::CustomErrorsSerializer
                      },
               status: :unprocessable_entity
      end

      # 401 Unauthorized
      match.unauthorized do |result|
        render jsonapi_errors: result[:errors][:unauthorized],
               class: { 'Hash': V1::Lib::Representer::CustomErrorsSerializer },
               status: :unauthorized
      end

      # 200 Ok
      match.verified do |result|
        render :no_content
      end
    end
  end

  def endpoint(operation_class, _options = {}, &block)
    ApiEndpoint.call(operation_class, default_handler, { params: params.to_unsafe_h, request: request }, &block)
  end
end
