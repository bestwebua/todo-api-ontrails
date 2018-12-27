module V1::Lib::Service
  class AddCustomError
    def self.call(ctx, status, **errors_collection)
      errors = ctx[:errors]
      errors[status] ||= {}

      errors_collection.each do |attribute, message|
        errors[status][attribute] ||= []
        errors[status][attribute] << message
      end

      errors
    end
  end
end
