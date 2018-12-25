module DocumentationEndpoints
  def documentation_handler
    lambda do |match|
      match.exists do |result|
        render file: result[:doc_path], layout: false
      end

      match.not_exists do |result|
        render html: result[:errors][:doc_path].join(', '), status: :not_found
      end
    end
  end

  def endpoint(operation_class, _options = {}, &block)
    DocumentationEndpoint.call(operation_class, documentation_handler, { params: params.to_unsafe_h }, &block)
  end
end
