module V1::Lib::Representer
  module ErrorComposer
    def as_jsonapi
      formatted_errors = errors.map do |field, messages|
        compose_errors(messages, field)
      end
      formatted_errors.flatten
    end

    private

      attr_reader :errors

      def compose_errors(messages, field)
        messages.map do |message|
          V1::Lib::Representer::ErrorRepresenter.new(field: field, message: message).as_jsonapi
        end
      end
  end
end
