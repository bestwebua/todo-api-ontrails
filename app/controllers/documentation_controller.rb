class DocumentationController < ActionController::Base
  def index
    render file: Api::DocSelectorService.call(params[:version]), layout: false
    rescue ActionView::MissingTemplate
      render html: I18n.t('errors.file_not_found'), status: :not_found
  end
end
