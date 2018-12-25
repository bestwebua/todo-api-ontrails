module V1::Lib::Representer
  class ErrorRepresenter < JSONAPI::Serializable::Error
    source do
      pointer "/data/attributes/#{@field.to_s.dasherize}"
    end

    title do
      "Invalid #{@field}"
    end

    detail do
      @message
    end
  end
end
