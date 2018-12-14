class DocumentationController < ActionController::Base
  include DocumentationEndpoints

  def show
    endpoint Documentations::Operation::Show
  end
end
