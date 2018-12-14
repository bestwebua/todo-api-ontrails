module DocumentationEndpoints
  def documentation_handler
    lambda do |html_doc|
      html_doc.exists do |result|
        render file: result[:doc_path], layout: false
      end

      html_doc.not_exists do |_result|
        render html: I18n.t('errors.file_not_found'), status: :not_found
      end
    end
  end

  def endpoint(operation_class, _options = {}, &block)
    DocumentationEndpoint.call(operation_class, documentation_handler, { params: params.to_unsafe_h }, &block)
  end
end
