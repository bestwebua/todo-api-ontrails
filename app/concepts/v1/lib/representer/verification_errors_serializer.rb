module V1::Lib::Representer
  class VerificationErrorsSerializer < JSONAPI::Serializable::Error
    def initialize(exposures)
      @errors = exposures[:object]
    end

    def as_jsonapi
      @errors
    end
  end
end
