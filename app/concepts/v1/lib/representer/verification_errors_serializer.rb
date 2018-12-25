module V1::Lib::Representer
  class VerificationErrorsSerializer
    include V1::Lib::Representer::ErrorComposer

    def initialize(exposures)
      @errors = exposures[:object]
    end
  end
end
