module Documentations::Operation
  class Show < Trailblazer::Operation
    step Contract::Build(constant: Documentations::Contract::Show)
    step :doc_exist?
    fail :file_not_found, fail_fast: true

    def doc_exist?(ctx, **)
      ctx[:doc_path] = Api::DocSelectorService.call(ctx[:params]['version'])
      ctx[:doc_path].exist?
    end

    def file_not_found(ctx, **)
      ctx['contract.default'].errors.add(:doc_path, I18n.t('errors.file_not_found'))
    end
  end
end
