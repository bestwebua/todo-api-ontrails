module V1::Lib::Representer
  class ReformErrorsSerializer
    include V1::Lib::Representer::ErrorComposer

    def initialize(exposures)
      @errors = exposures[:object].messages
    end
  end
end
