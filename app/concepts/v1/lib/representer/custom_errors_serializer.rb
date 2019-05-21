module V1::Lib::Representer
  class CustomErrorsSerializer
    include V1::Lib::Representer::ErrorComposer

    def initialize(exposures)
      @errors = exposures[:object]
    end
  end
end
